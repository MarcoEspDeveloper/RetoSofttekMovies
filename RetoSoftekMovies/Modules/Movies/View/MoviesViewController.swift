//
//  MoviesViewController.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 25/01/2024.
//

import UIKit
import MBProgressHUD

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var moviesSearchBar: UISearchBar!
    @IBOutlet weak var footerActivityIndicator: UIActivityIndicatorView!
    
    var presenter: MoviesPresenterProtocol?
    var configurator: MoviesConfiguratorProtocol?
    
    var isLoadingList = false
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configurator = MoviesConfigurator()
        configurator?.configure(viewController: self)
        
        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
        self.setupView()
    }
}

// MARK: - General Functions
extension MoviesViewController {
    
    func setupView() {
        
        let movieSearchToolBar = UIToolbar()
        let doneBtn = UIBarButtonItem(title: "Listo", style: .plain, target: self, action: #selector(handleViewTap))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        movieSearchToolBar.items = [flexSpace, flexSpace, doneBtn]
        movieSearchToolBar.sizeToFit()
        
        moviesSearchBar.returnKeyType = .done
        moviesSearchBar.showsCancelButton = true
        
        moviesTableView.tableFooterView?.isHidden = true
        
        presenter?.getMovieList()
    }
    
    @objc func handleViewTap() {
        view.endEditing(true)
    }
}

// MARK: - UISearchBar Delegate
extension MoviesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        presenter?.clearSearchedMovies()
        
        if let filteredMovies = presenter?.getMovies().filter({ ($0.title?.folding(options: [.caseInsensitive, .diacriticInsensitive], locale: .current).contains(searchText.folding(options: [.caseInsensitive, .diacriticInsensitive], locale: .current)))! }) {
            
            presenter?.setSearchedMovies(movies: searchText.isEmpty ? presenter?.getMovies() ?? [] : filteredMovies)
        }
        
        isSearching = true
        
        moviesTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        moviesSearchBar.endEditing(true)
        isSearching = false
    }
}

// MARK: - UITableView Delegate
extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            
            tableView.tableFooterView?.isHidden = true
            footerActivityIndicator.stopAnimating()
            
            return presenter?.getSearchedMovies().count ?? 0
        }
        
        return presenter?.getMovies().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let movie = presenter?.getSearchedMovies()[indexPath.row] {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath) as! MoviesTableViewCell
            
            cell.setupCell(movie: movie)
            
            cell.selectionStyle = .none
            
            return cell
        }
        
        return UITableViewCell(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if isSearching {
            
            if let movie = presenter?.getSearchedMovies()[indexPath.row] {
                
                presenter?.saveMovie(movie: movie)
                presenter?.goToDetail(movie: movie)
            }
        } else {
            
            if let movie = presenter?.getMovies()[indexPath.row] {
                
                presenter?.goToDetail(movie: movie)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if self.presenter?.getPage() == self.presenter?.getTotalPages() || isSearching {
            
            moviesTableView.tableFooterView?.isHidden = true
            footerActivityIndicator.stopAnimating()
            
            return
        }
        
        if (scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height && !isLoadingList {
            
            isLoadingList = true
            presenter?.getMovieList()
        }
    }
}

// MARK: - View Protrocol Implementation
extension MoviesViewController: MoviesViewProtocol {
    
    func showBasicAlert(title: String?, message: String?) {
        
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
        
        self.presenter?.goToErrorPopUp(title: title ?? "", message: message ?? "")
    }
    
    func showMovieList(fromSaved: Bool) {
        
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
        
        isLoadingList = false
        moviesTableView.reloadData()
        
        if fromSaved {
            
            moviesTableView.tableFooterView?.isHidden = true
            footerActivityIndicator.stopAnimating()
        } else {
            
            moviesTableView.tableFooterView?.isHidden = false
            footerActivityIndicator.startAnimating()
        }
    }
}

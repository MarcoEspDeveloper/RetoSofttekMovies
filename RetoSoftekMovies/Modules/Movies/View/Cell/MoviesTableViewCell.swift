//
//  MoviesTableViewCell.swift
//  RetoSoftekMovies
//
//  Created by Marco Antonio  on 27/01/2024.
//

import UIKit
import Kingfisher

class MoviesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension MoviesTableViewCell {
    
    func setupCell(movie: MovieModel?) {
        
        movieTitleLabel.text = movie?.title ?? ""
        
        if let url = URL(string: "\(Constants.ConnectionUrl.imageHostUrl)\(movie?.poster_path ?? "")") {
            
            movieImage.kf.setImage(with: url, options: [.transition(.fade(0.5))])
        }
    }
}

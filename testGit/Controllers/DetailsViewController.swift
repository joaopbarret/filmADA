//
//  DetailsViewController.swift
//  testGit
//
//  Created by jpbol on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie: Movie?
    @IBOutlet var backdropImage: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var posterImage: UIImageView!
    
    @IBOutlet var ratingLabel: UILabel!
    
    @IBOutlet var overviewLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let movie = movie else {
            
            return
        }
        self.title = movie.title
        backdropImage.image = UIImage(named:  movie.backdropPath)
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.posterPath)
        ratingLabel.text = "Rating: " + String( movie.voteAverage) + "/10"
        overviewLabel.text = movie.overview
        
        
        // Do any additional setup after loading the view.
    }
    

}

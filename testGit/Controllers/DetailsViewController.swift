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

        Task {
        let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
        let imagem = UIImage(data: imageData) ?? UIImage()
            backdropImage.image = imagem
        }
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let imagem = UIImage(data: imageData) ?? UIImage()
            posterImage.image = imagem
        }
        titleLabel.text = movie.title
        ratingLabel.text = "Rating: " + String(format: "%.1f", movie.voteAverage) + "/10"
        overviewLabel.text = movie.overview
        backdropImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? OfficialPosterViewController{
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie?.posterPath ?? "")
                let imagem = UIImage(data: imageData) ?? UIImage()
                destination.imagem.image = imagem
            }
        }
        
    }
    
    @objc private func imageTapped(_ recognizer: UITapGestureRecognizer) {
        performSegue(withIdentifier: "officialPosterSegue", sender: movie)
    }
}

//
//  UpcomingCollectionViewCell.swift
//  testGit
//
//  Created by jpbol on 12/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "upcomingCell"

    @IBOutlet var imagem: UIImageView!
    @IBOutlet var date: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    func setup (title: String, year: String, image: UIImage){
        titleLabel.text = title
        imagem.image = image
        date.text = year
    }
    
}

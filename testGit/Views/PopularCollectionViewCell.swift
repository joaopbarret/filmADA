//
//  PopularCollectionViewCell.swift
//  testGit
//
//  Created by jpbol on 11/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "popularCell"
    
    @IBOutlet var imagem: UIImageView!
    @IBOutlet var titleLabel: UILabel!
 
    func setup (title: String, image: UIImage){
        titleLabel.text = title
        imagem.image = image 
    }
    
}

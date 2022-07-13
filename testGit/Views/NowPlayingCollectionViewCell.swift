//
//  NowPlayingCollectionViewCell.swift
//  testGit
//
//  Created by jpbol on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "nowPlayingCell"

    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var imagem: UIImageView!
    @IBOutlet var dateLabel: UILabel!
}

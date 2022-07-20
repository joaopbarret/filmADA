//
//  TrendingTableViewCell.swift
//  testGit
//
//  Created by jpbol on 19/07/22.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {

    static let cellIdentifier = "trendingCell"
    @IBOutlet var titulo: UILabel!
    @IBOutlet var imagem: UIImageView!
    @IBOutlet var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    func setup (title: String, imagem: UIImage, year: String){
        titulo.text = title
        self.imagem.image = imagem
        dateLabel.text = year
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

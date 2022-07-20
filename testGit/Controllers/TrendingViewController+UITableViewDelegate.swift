//
//  TrendingViewController+UITableViewDelegate.swift
//  testGit
//
//  Created by jpbol on 19/07/22.
//

import Foundation
import UIKit

extension TrendingViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == trendingTableView {
        let movie = trendingMovies[indexPath.item]
        self.performSegue(withIdentifier: "detailsSegue2", sender: movie)
        }
        else {
            let movie = weekTrendingMovies[indexPath.item]
            self.performSegue(withIdentifier: "detailsSegue2", sender: movie)
        }
    }
    
}

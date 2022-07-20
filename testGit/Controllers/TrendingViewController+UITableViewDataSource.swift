//
//  TrendingViewController+UITableViewDataSource.swift
//  testGit
//
//  Created by jpbol on 19/07/22.
//

import Foundation
import UIKit

extension TrendingViewController:
    UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == trendingTableView{
        let cell = tableView.dequeueReusableCell(withIdentifier: TrendingTableViewCell.cellIdentifier, for: indexPath) as? TrendingTableViewCell
        
        let movie = trendingMovies[indexPath.item]
        
        Task{
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            
            let imagem = UIImage(data: imageData) ?? UIImage()
            
            cell?.setup(title: movie.title, imagem: imagem, year: String(movie.releaseDate.prefix(4)))
        }
            
        return cell ?? UITableViewCell()
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TrendingTableViewCell.cellIdentifier, for: indexPath) as? TrendingTableViewCell
            
            let movie = weekTrendingMovies[indexPath.row]
            
            Task{
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                
                let imagem = UIImage(data: imageData) ?? UIImage()
                
                cell?.setup(title: movie.title, imagem: imagem, year: String(movie.releaseDate.prefix(4)))
            }
                
            return cell ?? UITableViewCell()
        }
    }
}

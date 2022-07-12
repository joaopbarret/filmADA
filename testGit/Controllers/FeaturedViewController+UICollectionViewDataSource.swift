//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  testGit
//
//  Created by jpbol on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == popularCollectionView){
                return popularMovies.count
        }
        else if (collectionView == nowPlayingCollectionView){
                return nowPlayingMovies.count
        }
        else {
                return 0
        }

    }
    
    fileprivate func popularCellMaker(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell
        
        cell?.titleLabel.text = popularMovies[indexPath.item].title
        cell?.imagem.image = UIImage(named: popularMovies[indexPath.item].backdrop)
        return cell ?? UICollectionViewCell()
    }
    
    fileprivate func nowPlayingCellMaker( _ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as? NowPlayingCollectionViewCell
        
        cell?.titleLabel.text = nowPlayingMovies[indexPath.item].title
        cell?.dateLabel.text = nowPlayingMovies[indexPath.item].releaseDate
        cell?.imagem.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == popularCollectionView){
            return popularCellMaker(indexPath)
        }
        else if collectionView == nowPlayingCollectionView {
            return nowPlayingCellMaker(indexPath)
        }
        else {
            return UICollectionViewCell()
        }
    }
}

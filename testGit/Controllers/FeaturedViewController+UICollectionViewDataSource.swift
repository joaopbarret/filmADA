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
        else if collectionView == upcomingCollectionView{
            return upcomingMovies.count
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == popularCollectionView){
            return popularCellMaker(indexPath)
        }
        else if collectionView == nowPlayingCollectionView {
            return nowPlayingCellMaker(indexPath)
        }
        else if collectionView == upcomingCollectionView{
            return upcomingCellMaker(indexPath)
            
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    fileprivate func popularCellMaker(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell
        
        cell?.setup(title: popularMovies[indexPath.item].title,
                    image: UIImage())
        
        let movie = popularMovies[indexPath.item]
        
        Task {
            
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let imagem = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title: movie.title, image: imagem)
        }
        return cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func nowPlayingCellMaker( _ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell
        
        cell?.setup(title: nowPlayingMovies[indexPath.item].title, year: String(nowPlayingMovies[indexPath.item].releaseDate.prefix(4)), image: UIImage(named: nowPlayingMovies[indexPath.item].posterPath) ?? UIImage())
        
        
        return cell ?? NowPlayingCollectionViewCell()
    }
    
    fileprivate func upcomingCellMaker(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
        
        cell?.imagem.image = UIImage(named: upcomingMovies[indexPath.item].posterPath)
        
        return cell ?? UpcomingCollectionViewCell()
    }
    
    
}

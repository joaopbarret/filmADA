//
//  TrendingViewController.swift
//  testGit
//
//  Created by jpbol on 19/07/22.
//

import UIKit

class TrendingViewController: UIViewController {
    @IBOutlet var weekTrending: UIView!
    @IBOutlet var trendingSegmentedControl: UISegmentedControl!
    
    @IBOutlet var weekTrendingTableView: UITableView!
    @IBOutlet var dayTrending: UIView!
    @IBOutlet var trendingTableView: UITableView!
    var trendingMovies: [Movie] = []
    var weekTrendingMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trendingTableView.dataSource = self
        trendingTableView.delegate = self
        weekTrendingTableView.dataSource = self
        weekTrendingTableView.delegate = self
        weekTrending.isHidden = true
        weekTrendingTableView.backgroundColor =
        UIColor(white: 1, alpha: 0.5)
        trendingTableView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        Task {
            self.trendingMovies = await Movie.trendingDayMoviesAPI()
            self.trendingTableView.reloadData()
        }
        Task {
            self.weekTrendingMovies = await
            Movie.weekTrendingMoviesAPI()
            self.weekTrendingTableView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            let movie = sender as? Movie
            destination.movie = movie
            
        }
    
    }
    @IBAction func switchSC(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            dayTrending.isHidden = false
            weekTrending.isHidden = true
            break
        case 1:
            dayTrending.isHidden = true
            weekTrending.isHidden = false
            break
            
        default:
            dayTrending.isHidden = false
            break
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}

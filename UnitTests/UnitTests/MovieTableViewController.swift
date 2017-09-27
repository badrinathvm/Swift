//
//  MovieTableViewController.swift
//  UnitTests
//
//  Created by Badarinath Venkatnarayansetty on 9/26/17.
//  Copyright © 2017 Badarinath Venkatnarayansetty. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    var movies: [Movie] = []
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        movies =  MovieDataHelper.getMovies()
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        
        cell.titleLabel.text = movie.title
        cell.subTitleLabel.text = movie.genreString()
        
        return cell
        
    }


  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class MovieDataHelper{
    
    static func getMovies() -> [Movie]{
        
        var movies:[Movie] = []
        
        movies.append(Movie(title: "The Emoji Movie", genre: .Animation))
        movies.append(Movie(title: "Logan", genre: .Action))
        movies.append(Movie(title: "Wonder Woman", genre: .Action))
        movies.append(Movie(title: "Zootopia", genre: .Animation))
        movies.append(Movie(title: "The Baby Boss", genre: .Animation))
        movies.append(Movie(title: "Despicable Me 3", genre: .Animation))
        movies.append(Movie(title: "Spiderman: Homecoming", genre: .Action))
        movies.append(Movie(title: "Dunkirk", genre: .Animation))
        
        return movies
    }
}



extension MovieTableViewController{
    
    // MARK: - Table view data source
    
    
    
  

    
}

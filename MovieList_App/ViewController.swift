//
//  ViewController.swift
//  MovieList_App
//
//  Created by MAX WIDHALM on 10/19/22.
//

import UIKit

class AppData {
    
    static var movies = [Movie]()
    static var selectedRow = 0
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        AppData.movies.append(Movie(title: "Interstellar", date: 2014, rating: 9.4))
        AppData.movies.append(Movie(title: "Scott Plgrim vs. The World", date: 2010, rating: 9.9))
        AppData.movies.append(Movie(title: "Spiderman No Way Home", date: 2021, rating: 9.1))
        AppData.movies.append(Movie(title: "Star Wars: Revenge of the Sith", date: 2005, rating: 8.4))
        AppData.movies.append(Movie(title: "Avengers: Infinity War", date: 2018, rating: 9.5))
        AppData.movies.append(Movie(title: "Spiderman: Into the Spiderverse", date: 2018, rating: 9.5))
        AppData.movies.append(Movie(title: "Tenet", date: 2020, rating: 8.2))
        AppData.movies.append(Movie(title: "Inception", date: 2010, rating: 8.7))
        AppData.movies.append(Movie(title: "The Suicide Squad", date: 2021, rating: 8.7))
        AppData.movies.append(Movie(title: "Guardians of the Galaxy Vol. 2", date: 2017, rating: 9.0))
        AppData.movies.append(Movie(title: "Star Wars: The Empire Strikes Back", date: 1980, rating: 9.2))
        AppData.movies.append(Movie(title: "It's a Wonderful Life", date: 1946, rating: 9.7))
        
        if let items = UserDefaults.standard.data(forKey: "myMovies") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Movie].self, from: items) {
                AppData.movies = decoded
            }
        }
        tableViewOutlet.reloadData()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "detailSegue" {
//            let nvc = 
//        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MovieCell
        cell.configure(title: AppData.movies[indexPath.row].title, date: AppData.movies[indexPath.row].date, rating: AppData.movies[indexPath.row].rating)
        return cell
    }
    
    // function gets called when you select a row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("yhy \(indexPath.row)")
        AppData.selectedRow = indexPath.row
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    // allows you to both edit AND delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("YUH")
        if editingStyle == .delete {
            AppData.movies.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
        if textFieldOutlet.text != "" {
            AppData.movies.append(Movie(title:textFieldOutlet.text!))
            tableViewOutlet.reloadData()
            textFieldOutlet.text = ""
        }
        
        let encoder = JSONEncoder()
        // saving to user defaults
        if let encoded = try? encoder.encode(AppData.movies) {
            UserDefaults.standard.set(encoded, forKey: "myMovies")
        }
        
    }
    
//    @IBAction func saveAction(_ sender: UIBarButtonItem) {
//        defaults.set(AppData.movies, forKey: "myMovies")
//    }
    
    
    
    


}


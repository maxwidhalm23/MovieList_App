//
//  Movie.swift
//  MovieList_App
//
//  Created by MAX WIDHALM on 10/26/22.
//

import Foundation

public class Movie : Codable {
    
    var title : String
    var date : Int
    var rating : Double
    
    init(title: String, date: Int, rating: Double) {
        self.title = title
        self.date = date
        self.rating = rating
    }
    
    init(title: String) {
        self.title = title
        date = 2022
        rating = 0.0
    }
    
    init(title: String, date: Int) {
        self.title = title
        self.date = date
        rating = 0.0
    }
    
    init(title: String, rating: Double) {
        self.title = title
        date = 2022
        self.rating = rating
    }
}

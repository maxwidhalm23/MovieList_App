//
//  DetailViewController.swift
//  MovieList_App
//
//  Created by MAX WIDHALM on 11/2/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var yearOutlet: UILabel!
    @IBOutlet weak var ratingOutlet: UILabel!
    
    @IBOutlet weak var setTitleOutlet: UITextField!
    @IBOutlet weak var setYearOutlet: UITextField!
    @IBOutlet weak var setRatingOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleOutlet.text = AppData.movies[AppData.selectedRow].title
        yearOutlet.text = "\(AppData.movies[AppData.selectedRow].date)"
        ratingOutlet.text = "\(AppData.movies[AppData.selectedRow].rating)"
    }
    
    
    
    
}

//
//  MovieCell.swift
//  MovieList_App
//
//  Created by MAX WIDHALM on 10/26/22.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var dateOutlet: UILabel!
    @IBOutlet weak var ratingOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(title: String, date: Int, rating: Double) {
        titleOutlet.text = title
        dateOutlet.text = "\(date)"
        ratingOutlet.text = "\(rating)"
        
    }

}

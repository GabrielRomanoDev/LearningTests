//
//  movieCellTableViewCell.swift
//  TableView
//
//  Created by Gabriel Luz Romano on 11/04/23.
//

import UIKit

class movieCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var movieImage: UIImageView!
    
    static let identifier: String = "movieCellTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(movies:Movie){
        titleLabel.text = movies.title
        descLabel.text = movies.desc
        dateLabel.text = movies.date
        movieImage.image = movies.image
    }
    
}

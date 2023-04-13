//
//  Movie.swift
//  TableView
//
//  Created by Gabriel Luz Romano on 11/04/23.
//

import Foundation
import UIKit

struct Movie {
    var title: String
    var desc: String
    var date: String
    var image: UIImage
}

let movies: [Movie]=[
    Movie(title: "Spiderverse", desc: "A lot of spidermans", date: "23/04/2017", image: UIImage(imageLiteralResourceName: "One")),
    Movie(title: "X-men", desc: "Cyclops the best leader", date: "20/04/2000", image: UIImage(imageLiteralResourceName: "Two")),
    Movie(title: "Moon-Knight", desc: "Crazy Man", date: "02/06/2021", image: UIImage(imageLiteralResourceName: "Eight")),
    Movie(title: "Avengers", desc: "Heros of MCU", date: "23/04/2015", image: UIImage(imageLiteralResourceName: "Seven")),
    Movie(title: "Fantastic Four", desc: "Family", date: "23/04/2017", image: UIImage(imageLiteralResourceName: "Five"))
    
]

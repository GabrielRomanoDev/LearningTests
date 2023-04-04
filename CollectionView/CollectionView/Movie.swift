//
//  Movie.swift
//  CollectionView
//
//  Created by Gabriel Luz Romano on 04/04/23.
//

import Foundation
import UIKit

struct Movie {
    let title:String
    let image:UIImage
}

let movies: [Movie] = [
    Movie(title: "X-men", image:UIImage(imageLiteralResourceName: "one")),
    Movie(title: "Aranhaverso", image:UIImage(imageLiteralResourceName: "two")),
    Movie(title: "Ciclops", image:UIImage(imageLiteralResourceName: "three")),
    Movie(title: "SpiderMan", image:UIImage(imageLiteralResourceName: "four"))
]

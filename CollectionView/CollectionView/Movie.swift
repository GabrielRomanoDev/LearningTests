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
    Movie(title: "Spiderverse", image:UIImage(imageLiteralResourceName: "two")),
    Movie(title: "SpiderMan", image:UIImage(imageLiteralResourceName: "three")),
    Movie(title: "Ciclops", image:UIImage(imageLiteralResourceName: "four")),
    Movie(title: "Fantastic Four", image:UIImage(imageLiteralResourceName: "five")),
    Movie(title: "Thanos", image:UIImage(imageLiteralResourceName: "six")),
    Movie(title: "Avengers", image:UIImage(imageLiteralResourceName: "seven")),
    Movie(title: "Moon Knight", image:UIImage(imageLiteralResourceName: "eight")),
    Movie(title: "Dr Doom", image:UIImage(imageLiteralResourceName: "nine")),
    Movie(title: "Kang", image:UIImage(imageLiteralResourceName: "ten"))
]

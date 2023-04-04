//
//  TestCollectionViewCell.swift
//  CollectionView
//
//  Created by Gabriel Luz Romano on 03/04/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    
    func setup(with movie:Movie){
        movieImageView.image = movie.image
        titleLabel.text = movie.title
        
    }
    
}

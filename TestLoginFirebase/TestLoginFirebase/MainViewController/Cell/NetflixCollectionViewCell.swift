//
//  NetflixCollectionViewCell.swift
//  TestLoginFirebase
//
//  Created by Gabriel Luz Romano on 19/05/23.
//

import UIKit

class NetflixCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleBackGroundView: UIView!
    
    
    static let identifier:String = String(describing: NetflixCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func setupCell(netflixInfo: NetflixInfo) {
        titleLabel.text = netflixInfo.title
        subtitleLabel.text = netflixInfo.subTitle
        backgroundImage.image = UIImage(imageLiteralResourceName: netflixInfo.imageName)
    }
}

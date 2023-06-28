//
//  CustomTableViewCell.swift
//  PrimeiroProjetoTabBar350BF
//
//  Created by Caio Fabrini on 02/05/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier: String = String(describing: CustomTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.tintColor = .black
    }
    
    func setupCell(person: Person) {
        profileImageView.image = person.image
        nameLabel.text = person.name
    }
    
}

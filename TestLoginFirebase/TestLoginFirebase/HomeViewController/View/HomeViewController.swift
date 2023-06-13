//
//  HomeViewController.swift
//  TestLoginFirebase
//
//  Created by Gabriel Luz Romano on 11/06/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var smileLabel: UILabel!
    @IBOutlet weak var gabrielView: UIView!
    @IBOutlet weak var kidsView: UIView!
    
    static let identifier:String = String(describing: HomeViewController.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        
    }
    
    private func setupElements() {
        gabrielView.layer.cornerRadius = 15
        gabrielView.layer.masksToBounds = true
        kidsView.layer.cornerRadius = 15
        kidsView.layer.masksToBounds = true
        smileLabel.transform = CGAffineTransform(rotationAngle: .pi / 2)
    }

}

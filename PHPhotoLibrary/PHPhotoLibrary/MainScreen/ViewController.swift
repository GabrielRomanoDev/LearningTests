//
//  ViewController.swift
//  PHPhotoLibrary
//
//  Created by Gabriel Luz Romano on 17/05/23.
//

import UIKit
import Photos

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedImagePickerScrenButton(_ sender: UIButton) {
        let vc: ImagePickerViewController? = UIStoryboard(name: "ImagePickerViewController", bundle: nil).instantiateViewController(withIdentifier: "ImagePickerViewController") as? ImagePickerViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedPHPickerScreenButton(_ sender: UIButton) {
        let vc: PHPickerScreenViewController? = UIStoryboard(name: "PHPickerScreenViewController", bundle: nil).instantiateViewController(withIdentifier: "PHPickerScreenViewController") as? PHPickerScreenViewController
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
}



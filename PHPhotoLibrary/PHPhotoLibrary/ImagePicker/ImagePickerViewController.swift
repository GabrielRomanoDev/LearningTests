//
//  ImagePickerViewController.swift
//  PHPhotoLibrary
//
//  Created by Gabriel Luz Romano on 18/05/23.
//

import UIKit
import Photos

class ImagePickerViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImagePicker()
    }
    
    func setupImagePicker() {
        imagePicker.delegate = self
     }
    
    @IBAction func selectImageButton(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

}

extension ImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Método do delegate que é chamado quando uma imagem é selecionada
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)

        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // Faça o que quiser com a imagem selecionada
            // Por exemplo, exiba-a em uma UIImageView:
            imageView.image = selectedImage
        }
    }

    // Método do delegate que é chamado quando a seleção de imagem é cancelada
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

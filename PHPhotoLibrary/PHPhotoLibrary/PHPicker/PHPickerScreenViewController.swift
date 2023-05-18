//
//  PHPickerViewController.swift
//  PHPhotoLibrary
//
//  Created by Gabriel Luz Romano on 18/05/23.
//

import UIKit
import PhotosUI

class PHPickerScreenViewController: UIViewController, PHPickerViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tappedSelectImageButton(_ sender: UIButton) {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1

        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }

    // Método do delegate que é chamado quando uma imagem é selecionada
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)

        if let result = results.first {
            result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] object, error in
                if let image = object as? UIImage {
                    DispatchQueue.main.async {
                        // Faça o que quiser com a imagem selecionada
                        // Por exemplo, exiba-a em uma UIImageView:
                        self?.imageView.image = image
                    }
                }
            }
        }
    }

    // Método do delegate que é chamado quando a seleção de imagem é cancelada
    func pickerDidCancel(_ picker: PHPickerViewController) {
        picker.dismiss(animated: true, completion: nil)
    }

}

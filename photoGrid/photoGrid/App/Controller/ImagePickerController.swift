//
//  ImagePickerController.swift
//  photoGrid
//
//  Created by Lau on 08/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import UIKit

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // Add photo
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        guard button != nil else { return }
        
        if let image = info[.editedImage] as? UIImage {
            self.button!.setImage(image, for: .normal)
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.button!.setImage(image, for: .normal)
        }
        dismiss(animated: true)
    }
    
    func imagePickerController() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true)
        imagePickerController.allowsEditing = true
    }
    
    func addPhoto(button: UIButton) {
        self.button = button
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        alert.libraryOrCameraSource(viewController: self, imagePickerController: imagePickerController)
    }
}

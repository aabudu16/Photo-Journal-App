//
//  AddPhotoViewController.swift
//  PhotoJournal-Assignment
//
//  Created by Mr Wonderful on 10/1/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController {
    @IBOutlet var photoImage: UIImageView!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       textField.delegate = self
    }
    


    @IBAction func photoLibraryButtonPressed(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension AddPhotoViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage{
           photoImage.image = selectedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}

extension AddPhotoViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let textFieldValue = textField.text{
          
             let photoVC = storyboard?.instantiateViewController(withIdentifier: "PhotoViewController") as? PhotoViewController
            
            photoVC?.message = [textFieldValue]
            
        }
        return true
    }
}

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
    var userSelectedImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }
    
    private func createDateAndTime()->String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd,yyyy HH:mm:ss"
        return dateFormatter.string(from: date)
        
    }
    private func createPhotoJournal() -> PhotoJournalWrapper{
        let imageData = userSelectedImage.pngData()
        return PhotoJournalWrapper(createdDate: createDateAndTime(), message: textField.text ?? "", picture: imageData ?? Data())
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
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let photoVC = storyboard?.instantiateViewController(withIdentifier: "PhotoViewController") as? PhotoViewController else {return}
        
        photoVC.message += [createPhotoJournal()]
        print(createPhotoJournal())
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension AddPhotoViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage{
            photoImage.image = selectedImage
            userSelectedImage = selectedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}

extension AddPhotoViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let textFieldValue = textField.text{
            
        }
        return true
    }
}

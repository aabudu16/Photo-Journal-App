//
//  AddPhotoViewController.swift
//  PhotoJournal-Assignment
//
//  Created by Mr Wonderful on 10/3/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController {
    @IBOutlet var photoImage: UIImageView!
    @IBOutlet var textField: UITextField!
    @IBOutlet var saveButton: UIButton!
    var message:String!
    var currentIndex: Int?
    var journal:PhotoJournal?
    let formattedDate = "MMM/dd/yyyy HH:mm:ss"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        saveButton.isEnabled = false
        insertPreviousData()
    }
    
    private func insertPreviousData(){
        if let entry = journal {
            textField.text = entry.message
            photoImage.image = UIImage(data: entry.picture)
        }
    }
    private func saveUserInput(){
        guard let imageData = self.photoImage.image?.jpegData(compressionQuality: 0.7) else {return}
        
        let photoJournalData = PhotoJournal(createdDate: currentDate(), message: message, picture: imageData)
        
        try? EntryPersistenceHelper.manager.save(entry: photoJournalData)
    }
    
    
    private func updateUserInput() {
        guard let imageData = self.photoImage.image?
            .jpegData(compressionQuality: 0.7)
            else { return }
        
        let updateEntry = PhotoJournal(createdDate: currentDate(), message: message, picture: imageData)
        
        try? EntryPersistenceHelper.manager.editEntry(editEntry: updateEntry, index: currentIndex ?? 0)
    }
    
    
    private func currentDate()->String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = formattedDate
        return formatter.string(from: date)
    }
    
    @IBAction func photoLibraryButtonPressed(_ sender: UIBarButtonItem) {
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
        
        if textField != nil && photoImage != nil {
            updateUserInput()
            self.dismiss(animated: true, completion: nil)
        } else {
            saveUserInput()
            self.dismiss(animated: true, completion: nil)
        }
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
        message = textField.text
        if textField.text == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
        
        return true
    }
}

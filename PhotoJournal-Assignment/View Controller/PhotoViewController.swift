//
//  ViewController.swift
//  PhotoJournal-Assignment
//
//  Created by Mr Wonderful on 10/3/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet var photoCollectionView: UICollectionView!
    var journalEntry = [PhotoJournal](){
        didSet{
            photoCollectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       loadUserPickedPhotoJournal()
    }
    
   private func setupCollectionView(){
         photoCollectionView.delegate = self
          photoCollectionView.dataSource = self
    }
    
    private func loadUserPickedPhotoJournal(){
        do{
         journalEntry =  try EntryPersistenceHelper.manager.getPhotos()
            
        }catch{
            print(error)
        }
    }
    @IBAction func moreButtonPressed(_ sender: UIButton) {
        ThisFunction.Will.CreateAnActionSheet()
    }
    
    
    @IBAction func addPhotoButtonPressed(_ sender: UIBarButtonItem) {
        guard let addPhotoVC = storyboard?.instantiateViewController(withIdentifier: "AddPhotoViewController") as? AddPhotoViewController else {return}
        
        addPhotoVC.modalPresentationStyle = .currentContext
        self.present(addPhotoVC, animated: true, completion: nil)
    }
    
}

extension PhotoViewController:UICollectionViewDelegate{}
extension PhotoViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return journalEntry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? PhotoCollectionViewCell else {return UICollectionViewCell()}
        
        let info = journalEntry[indexPath.item]
        cell.dateLabel.text = info.createdDate
        cell.messageLabel.text = info.message
        cell.photoImage.image = UIImage(data: info.picture)
        
        return cell
    }
    
    
}

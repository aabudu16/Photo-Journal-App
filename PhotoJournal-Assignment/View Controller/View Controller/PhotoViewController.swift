//
//  ViewController.swift
//  PhotoJournal-Assignment
//
//  Created by Mr Wonderful on 9/27/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet var photoCollectionView: UICollectionView!
    var message = [PhotoJournalWrapper](){
        didSet{
            photoCollectionView.reloadData()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       setupCollectionView()
    }
    
   private func setupCollectionView(){
       photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
    }
    
    @IBAction func moreButtonPressed(_ sender: UIButton) {
        ThisFunction.Will.CreateAnActionSheet()
    }
    
    
    @IBAction func addPhotoButtonPressed(_ sender: UIBarButtonItem) {
        guard let addPhotoVC = storyboard?.instantiateViewController(withIdentifier: "AddPhotoViewController") as? AddPhotoViewController else {return}
        
        self.present(addPhotoVC, animated: true, completion: nil)
    }
    
}

extension PhotoViewController:UICollectionViewDelegate{}
extension PhotoViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return message.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? PhotoCollectionViewCell else {return UICollectionViewCell()}
        
        let info = message[indexPath.item]
        cell.dateLabel.text = info.createdDate
        cell.messageLabel.text = info.message
        return cell
    }


}

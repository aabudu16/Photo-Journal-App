//
//  ViewController.swift
//  PhotoJournal-Assignment
//
//  Created by Mr Wonderful on 10/3/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit


class PhotoViewController: UIViewController{
    
    enum Identifiers:String{
        case addPhotoViewController
        case photoCollectionViewCell
        case SettingdViewController
        case PhotoDetailViewController
    }
    
    @IBOutlet var photoCollectionView: UICollectionView!
    var darkModeIsOn = false
    var horizontalDirection = false
    
    var selectedIndexPath:IndexPath!
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
            journalEntry =  try EntryPersistenceHelper.manager.getEntries()
            
        }catch{
            print(error)
        }
    }
    
    @IBAction func addPhotoButtonPressed(_ sender: UIBarButtonItem) {
        guard let addPhotoVC = storyboard?.instantiateViewController(withIdentifier: Identifiers.addPhotoViewController.rawValue) as? AddPhotoViewController else {return}
        
        addPhotoVC.modalPresentationStyle = .currentContext
        self.present(addPhotoVC, animated: true, completion: nil)
    }
    
    @IBAction func settingsButtonPressed(_ sender: UIBarButtonItem) {
        let settingsVC = storyboard?.instantiateViewController(withIdentifier: Identifiers.SettingdViewController.rawValue) as! SettingdViewController
        settingsVC.delegate = self
        settingsVC.switchOnOrOff = self.darkModeIsOn
        
        settingsVC.directionDelegate = self
        settingsVC.horizonlScrollDirection = self.horizontalDirection
        self.navigationController?.pushViewController(settingsVC, animated: true)
}
}
extension PhotoViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       guard let photoDetailedVC = storyboard?.instantiateViewController(withIdentifier: Identifiers.PhotoDetailViewController.rawValue) as? PhotoDetailViewController else {return}
        
        self.selectedIndexPath = indexPath
       let info = journalEntry[indexPath.item]
        photoDetailedVC.photoImage = info
        self.navigationController?.pushViewController(photoDetailedVC, animated: true)
    }
}
extension PhotoViewController:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return journalEntry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = Identifiers.photoCollectionViewCell.rawValue
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? PhotoCollectionViewCell else {return UICollectionViewCell()}
        
        let info = journalEntry[indexPath.item]
        CustomLayer.shared.createCustomlayer(layer: cell.layer)
       cell.photoImage.layer.cornerRadius = 25
       
        
        cell.delegate = self
        cell.moreButtonOutlet.tag = indexPath.item
        cell.dateLabel.text = info.createdDate
        cell.messageLabel.text = info.message
        cell.photoImage.image = UIImage(data: info.picture)
    
        return cell
    }
  
}
extension PhotoViewController: SettingsDelegate {
    func darkModeOn() {
        self.photoCollectionView.backgroundColor = .black
        self.darkModeIsOn = true
    }
    
    func darkModeOff() {
        self.photoCollectionView.backgroundColor = .white
        self.darkModeIsOn = false
    }
}

extension PhotoViewController: ScrollDirectionDelegate{
    func setHorizontalDirection(){
        let layout = photoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout!.scrollDirection = .horizontal
        self.horizontalDirection = true
    }
    
    func setVerticalDirection(){
        let layout = photoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout!.scrollDirection = .vertical
        self.horizontalDirection = false
    }
}
extension PhotoViewController:ZoomingViewController{
    func ZoomingImageView(for transition: ZoomInTransitonDelegate) -> UIImageView? {
        if let indexPath = selectedIndexPath{
            guard let cell = photoCollectionView?.cellForItem(at:indexPath) as? PhotoCollectionViewCell else {return UIImageView()}
            return cell.photoImage
    }
        return nil
}
}

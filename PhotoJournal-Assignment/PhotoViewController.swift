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
    override func viewDidLoad() {
        super.viewDidLoad()
       setupCollectionView()
    }
    
    func setupCollectionView(){
       photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
    }
    @IBAction func moreButtonPressed(_ sender: UIButton) {
    }
    
}

extension PhotoViewController:UICollectionViewDelegate{}
extension PhotoViewController:UICollectionViewDataSource{
    
}

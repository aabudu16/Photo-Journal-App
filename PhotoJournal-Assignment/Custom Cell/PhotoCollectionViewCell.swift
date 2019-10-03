//
//  PhotoCollectionViewCell.swift
//  PhotoJournal-Assignment
//
//  Created by Mr Wonderful on 9/27/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    var buttonFunction:(()->())?
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var photoImage: UIImageView!
    
    @IBAction func moreButtonPressed(_ sender: UIButton) {
        
    }
    
}

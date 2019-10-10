//
//  PhotoCollectionViewCell.swift
//  PhotoJournal-Assignment
//
//  Created by Mr Wonderful on 9/27/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

protocol CollectionViewCellDelegate: AnyObject {
    func actionSheet(tag: Int)
}

class PhotoCollectionViewCell: UICollectionViewCell {
    
    var buttonFunction:(() -> Void)?
    
    @IBOutlet var moreButtonOutlet: UIButton!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var photoImage: UIImageView!
    
    weak var delegate: CollectionViewCellDelegate?
    
    @IBAction func moreButtonPressed(_ sender: UIButton) {
        
        delegate?.actionSheet(tag: sender.tag)
        
        if let closure = buttonFunction{
            closure()
        }
    }
    
}

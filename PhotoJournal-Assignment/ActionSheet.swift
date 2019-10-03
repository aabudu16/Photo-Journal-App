//
//  ActionSheet.swift
//  PhotoJournal-Assignment
//
//  Created by Mr Wonderful on 10/2/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation
import UIKit

class ThisFunction{
   static let Will = ThisFunction()
    
    func CreateAnActionSheet(){
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let delete = UIAlertAction(title: "Delete", style: .destructive, handler: { (delete) in
            //write code to delete a cell
        })
        let edit = UIAlertAction(title: "Delete", style: .destructive, handler: { (delete) in
            //write code to delete a cell
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(delete)
        actionSheet.addAction(edit)
        actionSheet.addAction(cancel)
    }
}

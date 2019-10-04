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
    static let will = ThisFunction()
    
    func createAnActionSheet(deleteEntry:Int? = nil)-> UIAlertController{
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let delete = UIAlertAction(title: "Delete", style: .destructive, handler: { (delete) in
            //write code to delete a cell
        })
        let edit = UIAlertAction(title: "Edit", style: .default, handler: { (edit) in
            //write code to edit a cell
        })
        let share = UIAlertAction(title: "share", style: .default, handler: { (share) in
            
            
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(delete)
        actionSheet.addAction(edit)
        actionSheet.addAction(share)
        actionSheet.addAction(cancel)
        return actionSheet
    }
    
    
}

//
//  extension-PhotoViewController-AcrtionSheet.swift
//  PhotoJournal-Assignment
//
//  Created by Mr Wonderful on 10/4/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation
import UIKit

extension PhotoViewController: CollectionViewCellDelegate{
    
    //ActivityViewController
    private func createAnActivityController(entryImage:UIImage)->UIActivityViewController{
        let activityController = UIActivityViewController(activityItems: [entryImage], applicationActivities: nil)
        return activityController
    }
    
    func actionSheet(tag: Int) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let delete = UIAlertAction(title: "Delete", style: .destructive, handler: { (delete) in
            //write code to delete a cell
            let deleteItem = self.journalEntry[tag]
            self.journalEntry.remove(at: tag)
            
            do {
                try EntryPersistenceHelper.manager.deleteFavorite(withMessage: deleteItem.message)
            } catch {
                print(error)
            }
        })
        let edit = UIAlertAction(title: "Edit", style: .default, handler: { (edit) in
            //write code to edit a cell
           
        })
        let share = UIAlertAction(title: "Share", style: .default, handler: { (share) in
            let image = self.journalEntry[tag].picture
            let userImage = UIImage(data: image)
            let sharedItem = self.createAnActivityController(entryImage: userImage!)
            self.present(sharedItem, animated: true, completion: nil)
            
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(delete)
        actionSheet.addAction(edit)
        actionSheet.addAction(share)
        actionSheet.addAction(cancel)
        present(actionSheet, animated: true, completion: nil)
    }
    
    
}

//
//  SaveFolderManager.swift
//  PhotoJournal-Assignment
//
//  Created by Mr Wonderful on 9/27/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation

class SaveFolderManager{
    
    func savedFolder()-> URL{
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let theFileName = "/theUserFile.json"
        let thePathToTheFile = documentsDirectory.appendingPathComponent(theFileName)
        return thePathToTheFile
    }
}

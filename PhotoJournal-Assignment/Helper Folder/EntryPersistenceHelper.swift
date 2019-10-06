//
//  PhotoPersistenceHelper.swift
//  Pixabay-Photos-Save-Local
//
//  Created by Mr Wonderful on 10/1/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation

struct EntryPersistenceHelper {
    static let manager = EntryPersistenceHelper()
    
    func save(entry: PhotoJournal) throws {
        try persistenceHelper.save(newElement: entry)
    }
    
    func getEntries() throws -> [PhotoJournal] {
        return try persistenceHelper.getObjects()
    }
    
    func deleteFavorite(withMessage: String) throws {
        do {
            let entries = try getEntries()
            let newEntries = entries.filter { $0.message != withMessage}
            try persistenceHelper.replace(elements: newEntries)
        }
    }
    
//    func editUserEntry(entry: PhotoJournal) throws {
//        
//        try persistenceHelper.replace(elements: [entry])
//    }
    private let persistenceHelper = PersistenceHelper<PhotoJournal>(fileName: "photos.plist")
    
    private init() {}
}

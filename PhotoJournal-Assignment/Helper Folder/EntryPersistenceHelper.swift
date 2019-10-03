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
    
    func getPhotos() throws -> [PhotoJournal] {
        return try persistenceHelper.getObjects()
    }
    
    private let persistenceHelper = PersistenceHelper<PhotoJournal>(fileName: "photos.plist")
    
    private init() {}
}

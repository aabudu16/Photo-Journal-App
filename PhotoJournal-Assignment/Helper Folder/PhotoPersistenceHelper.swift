//
//  PhotoPersistenceHelper.swift
//  Pixabay-Photos-Save-Local
//
//  Created by Mr Wonderful on 10/1/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation

struct PhotoPersistenceHelper {
    static let manager = PhotoPersistenceHelper()
    
    func save(newPhoto: PhotoJournalWrapper) throws {
        try persistenceHelper.save(newElement: newPhoto)
    }
    
    func getPhotos() throws -> [PhotoJournalWrapper] {
        return try persistenceHelper.getObjects()
    }
    
    private let persistenceHelper = PersistenceHelper<PhotoJournalWrapper>(fileName: "photos.plist")
    
    private init() {}
}

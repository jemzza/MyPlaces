//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Alexander on 15.02.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ place: Place) {
        
        try! realm.write {
            realm.add(place)
        }
    }
    
    static func deleteObject(_ place: Place) {
        
        try! realm.write {
            realm.delete(place)
        }
    }
}



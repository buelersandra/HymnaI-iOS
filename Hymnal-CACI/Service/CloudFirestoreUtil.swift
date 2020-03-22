//
//  CloudFirestoreUtil.swift
//  Hymnal-CACI
//
//  Created by Beulah Ana on 22/03/2020.
//  Copyright © 2020 Fhoodi. All rights reserved.
//

import Foundation
import Firebase

class CloudFirestoreUti {
    static let shared = CloudFirestoreUti()

    let COLLECTION_HYMN="hymn"
    let COLLECTION_VERSE="verse"
    
    let db = Firestore.firestore()
    
    func getHymnCollection(){
        
    }
    
    func getVerseCollection(){
        
    }

}

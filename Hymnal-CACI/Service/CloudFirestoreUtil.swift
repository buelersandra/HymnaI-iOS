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
    
    func getHymnCollection( callback:@escaping ([Hymn])->Void){
        var ids = [String]()
        let list = [Hymn]()
        
        db.collection(COLLECTION_HYMN).getDocuments(completion: {a,error in
            if let querySnapshot = a{
                if !querySnapshot.isEmpty {
                    print("querySnapshot : \(querySnapshot.count)")
                    querySnapshot.documents.forEach({
                        document in
                        ids.append(document.documentID)
                        
                    })
                    
                    callback([])
                }
                
            
            }
            
            
        })
    }
    
    func getVerseCollection(callback:@escaping ([Verse])->Void){
        db.collection(COLLECTION_VERSE).getDocuments(completion: {a,b in
            if let querySnapshot = a{
                if !querySnapshot.isEmpty {
                    print("querySnapshot : \(querySnapshot.count)")
                    querySnapshot.documents.forEach({
                        document in
                        
                        callback([])
                    })
                }
                
            
            }
            
        })
        
    }

}

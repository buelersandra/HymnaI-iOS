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
        var list = [Hymn]()
        
        db.collection(COLLECTION_HYMN).getDocuments(completion: {a,error in
            if let querySnapshot = a{
                if !querySnapshot.isEmpty {
                    print("querySnapshot : \(querySnapshot.count)")
                    querySnapshot.documents.forEach({
                        document in
                        let title = document.get("title") as! String
                        let numberRange = title.index(title.startIndex, offsetBy: 8)..<title.endIndex
                        let number = String(title[numberRange])
                        print("hymn number \(number)")
                        list.append(
                            Hymn(id: document.documentID,
                                 title: title,
                                 number: Int(number)! ,
                                chorus: document.get("chorus") as! String))})
                    
                    callback(list)
                }else{
                    callback(list)
                }
                
            
            }else{
                callback(list)
            }
            
            
        })
    }
    
    func getVerseCollection(callback:@escaping ([Verse])->Void){
        var list = [Verse]()
        db.collection(COLLECTION_VERSE).getDocuments(completion: {a,b in
            if let querySnapshot = a{
                if !querySnapshot.isEmpty {
                    print("querySnapshot : \(querySnapshot.count)")
                    querySnapshot.documents.forEach({
                        document in
                        list.append(
                            Verse(id: document.documentID,
                                  hymnId: document.get("hymnId") as! String,
                                  verseNumber: document.get("verseNumber") as! Int,
                                  verse: document.get("verse") as! String))
                        
                        callback(list)
                    })
                }
                
            
            }
            
        })
        
    }

}

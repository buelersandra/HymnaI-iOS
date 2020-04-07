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
    
    var verselist = [Verse]()
    
    func getHymnCollection( callback:@escaping ([Hymn])->Void){
        var list = [Hymn]()
        
        getVerseCollection(callback: {list in
            self.verselist = list.sorted(by: {a,b in
                a.verseNumber<b.verseNumber
            })
        })
        
        db.collection(COLLECTION_HYMN).getDocuments(completion: {a,error in
            if let querySnapshot = a{
                if !querySnapshot.isEmpty {
                    print("querySnapshot : \(querySnapshot.count)")
                    querySnapshot.documents.forEach({
                        document in
                        let title = document.get("title") as! String
                        let numberRange = title.index(title.startIndex, offsetBy: 9)..<title.endIndex
                        let number = String(title[numberRange]).trimmingCharacters(in: .whitespaces)
                        //print("title \(title) : hymn number \(number)")
                        list.append(
                            Hymn(id: document.documentID,
                                 title: title,
                                 number: Int(number) ?? 0 ,
                                chorus: document.get("chorus") as! String))})
                                        
                    callback(list.unique(map: {$0.number}))
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
                    print("Verse querySnapshot : \(querySnapshot.count)")
                    querySnapshot.documents.forEach({
                        document in
                        list.append(
                            Verse(id: document.documentID,
                                  hymnId: document.get("hymnId") as! String,
                                  verseNumber: document.get("verseNumber") as! Int,
                                  verse: document.get("verse") as! String))
                        
                        
                       
                    })
                    
                    callback(list)
                }
                
            
            }
            
        })
        
    }
    
    
    func getVerse(_ id:String) -> [Verse]{
        var result = [Verse]()
        verselist.forEach({verse in
            if(verse.hymnId == id){
                result.append(verse)
            }
            
        })
        return result
    }

}

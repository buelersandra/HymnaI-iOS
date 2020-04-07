//
//  Model.swift
//  Hymnal-CACI
//
//  Created by Beulah Ana on 22/03/2020.
//  Copyright © 2020 Fhoodi. All rights reserved.
//

import Foundation

struct Hymn: Codable{
    let id:String
    let title:String
    let number:Int
    let chorus:String
    
//    static func == (lhs: Hymn, rhs: Hymn) -> Bool {
//        return lhs.number == rhs.number
//    }
    
    enum CodingKeys: String, CodingKey {
        case id,title,number,chorus
    }
    
}


struct Verse:Codable {
    let id:String
    let hymnId:String
    let verseNumber:Int
    let verse:String
    
    enum CodingKeys: String, CodingKey {
        case id,hymnId,verseNumber,verse
    }
}

extension Array {
    func unique<T:Hashable>(map: ((Element) -> (T)))  -> [Element] {
        var set = Set<T>() //the unique list kept in a Set for fast retrieval
        var arrayOrdered = [Element]() //keeping the unique list of elements but ordered
        for value in self {
            if !set.contains(map(value)) {
                set.insert(map(value))
                arrayOrdered.append(value)
            }
        }

        return arrayOrdered
    }
}

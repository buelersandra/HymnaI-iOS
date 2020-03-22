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
    
    enum CodingKeys: String, CodingKey {
        case id,title,number,chorus
    }
    
}


struct Verse:Codable {
    let id:Int
    let hymnId:String
    let verseNumber:Int
    let verse:String
    
    enum CodingKeys: String, CodingKey {
        case id,hymnId,verseNumber,verse
    }
}

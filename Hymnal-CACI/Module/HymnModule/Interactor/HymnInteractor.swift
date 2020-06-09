//
//  HymnInteractor.swift
//  Hymnal-CACI
//
//  Created by Beulah Ana on 05/06/2020.
//  Copyright © 2020 Fhoodi. All rights reserved.
//

import Foundation

class HymnInteractor:InteractorHymnProtocol{
    var presenter: InteractorToPresenterPostsListProtocol?
    
    func loadHymns() {
        CloudFirestoreUti.shared.getHymnCollection(callback: { list in
            
            self.presenter?.postsSuccess(postList: list)
            
            //add error
           
        })
    }
    
    
}
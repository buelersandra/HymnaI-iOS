//
//  HymnPresenter.swift
//  Hymnal-CACI
//
//  Created by Beulah Ana on 05/06/2020.
//  Copyright © 2020 Fhoodi. All rights reserved.
//

import Foundation

class HymnPresenter:PresenterHymnProtocol{
    var view: ViewHymnProtocol?
    
    var interactor: InteractorHymnProtocol?
    
    var router: RouterHymnProtocol?
    
    func fetchHymn() {
        
    }
    
    
}


extension HymnPresenter:InteractorToPresenterPostsListProtocol{
    func postsSuccess(postList: Array<Hymn>) {
        view?.showHymns(hymnList: postList)
    }
    
    func postsFailed() {
        view?.showEmptyState(error: "")
    }
    
    
    
    
}

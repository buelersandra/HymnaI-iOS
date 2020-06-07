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
        interactor?.loadHymns()
    }
    
    
}


extension HymnPresenter:InteractorToPresenterPostsListProtocol{
    func postsSuccess(postList: Array<Hymn>) {
        let hymnList = postList.sorted(by: {a,b in
            a.number<b.number
        })
        view?.showHymns(hymnList: hymnList)
    }
    
    func postsFailed() {
        view?.showEmptyState(error: "")
    }
    
    
    
    
}

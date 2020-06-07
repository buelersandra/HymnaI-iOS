//
//  File.swift
//  Hymnal-CACI
//
//  Created by Beulah Ana on 05/06/2020.
//  Copyright © 2020 Fhoodi. All rights reserved.
//

import Foundation

protocol PresenterHymnProtocol:class{
    var view: ViewHymnProtocol? {get set}
    var interactor: InteractorHymnProtocol? {get set}
    var router:RouterHymnProtocol? {get set}
    func fetchHymn()
}

protocol ViewHymnProtocol:class {
    func showHymns(hymnList: Array<Hymn>)
    func showEmptyState(error: String)
}

protocol RouterHymnProtocol:class {
    
    static func createHymnModule(hymnController: HymnController)
    
}

protocol InteractorHymnProtocol:class {
    
    var presenter: InteractorToPresenterPostsListProtocol? {get set}
    func loadPosts()
    
}

protocol InteractorToPresenterPostsListProtocol:class {
    func postsSuccess(postList: Array<Hymn>)
    func postsFailed()
}

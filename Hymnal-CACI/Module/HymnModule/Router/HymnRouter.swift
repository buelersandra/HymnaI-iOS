//
//  HymnRouter.swift
//  Hymnal-CACI
//
//  Created by Beulah Ana on 05/06/2020.
//  Copyright © 2020 Fhoodi. All rights reserved.
//

import Foundation
class HymnRouter:RouterHymnProtocol{
    
    static func createHymnModule(hymnController: HymnController) {
        let presenter: PresenterHymnProtocol & InteractorToPresenterPostsListProtocol = HymnPresenter()
        
        hymnController.presenter = presenter
        hymnController.presenter?.router = HymnRouter()
        hymnController.presenter?.view = hymnController
        hymnController.presenter?.interactor = HymnInteractor()
        hymnController.presenter?.interactor?.presenter = presenter
        
        
    }
    
    
    
}

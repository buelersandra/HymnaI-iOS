//
//  ViewController.swift
//  Hymnal-CACI
//
//  Created by Beulah Ana on 12/03/2020.
//  Copyright © 2020 Fhoodi. All rights reserved.
//

import UIKit

class HymnCell: UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
}
/*
 Presenter
 View
 Interactor
 Router
 
 Protocol
 */

class HymnController: UIViewController {
    
    @IBOutlet weak var hymnTableView: UITableView!
    var hymnList = [Hymn]()
    var presenter:PresenterHymnProtocol?
    
    
    override func viewDidLoad() {
         
       
        super.viewDidLoad()
        self.navigationController?.title = "CACI Hymnal"
        hymnTableView.delegate = self
        hymnTableView.dataSource = self
        HymnRouter.createHymnModule(hymnController: self)
        presenter?.fetchHymn()

    }


}

extension HymnController:ViewHymnProtocol {
    func showHymns(hymnList: Array<Hymn>) {
        self.hymnList = hymnList
        self.hymnTableView.reloadData()
    }
    
    func showEmptyState(error: String) {
        
    }
    
    
}

extension HymnController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hymnList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HymnCell
        cell.titleLabel.text = hymnList[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        let verseController = storyboard?.instantiateViewController(withIdentifier: "VerseController") as! VerseController
        verseController.hymn = hymnList[indexPath.row];        self.navigationController?.pushViewController(verseController,animated: true)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(90)
    }
    
    
}

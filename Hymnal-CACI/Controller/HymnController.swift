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

class HymnController: UIViewController {
    
    @IBOutlet weak var hymnTableView: UITableView!
    var hymnList = [Hymn]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "CACI Hymnal"
        hymnTableView.delegate = self
        hymnTableView.dataSource = self

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
        let verseController = VerseController()
        verseController.hymn = hymnList[indexPath.row]
        self.navigationController?.present(verseController, animated: true, completion: nil)
        
    }
    
    
}


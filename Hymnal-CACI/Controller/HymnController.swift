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
         CloudFirestoreUti.shared.getHymnCollection(callback: { list in
            self.hymnList = list.sorted(by: {a,b in
                a.number<b.number
            })
            
            
            self.hymnTableView.reloadData()
        })
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
                
        let verseController = storyboard?.instantiateViewController(withIdentifier: "VerseController") as! VerseController
        verseController.hymn = hymnList[indexPath.row];        self.navigationController?.pushViewController(verseController,animated: true)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(90)
    }
    
    
}


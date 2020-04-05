//
//  VerseController.swift
//  Hymnal-CACI
//
//  Created by Beulah Ana on 22/03/2020.
//  Copyright © 2020 Fhoodi. All rights reserved.
//

import UIKit

class VerseCell:UITableViewCell{
    
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var verseLabel: UILabel!
}

class VerseController: UIViewController {
    
    var verseList = [Verse]()
    var hymn:Hymn!

    @IBOutlet weak var verseTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.title = hymn.title
        verseTableView.delegate = self
        verseTableView.dataSource = self
        

    }
    
    
    func showChorus(){
        self.navigationController?.present(ChorusController(), animated: true, completion: nil)
    }
    


}

extension VerseController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return verseList.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! VerseCell
        cell.numberLabel.text = String(verseList[indexPath.row].verseNumber) 
        cell.verseLabel.text = verseList[indexPath.row].verse
        return cell
    }
    
    
    
    
    
}

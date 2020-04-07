//
//  ChorusController.swift
//  Hymnal-CACI
//
//  Created by Beulah Ana on 22/03/2020.
//  Copyright © 2020 Fhoodi. All rights reserved.
//

import UIKit

class ChorusController: UIViewController {
    
    var chorus:String!

    @IBOutlet weak var chorusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        chorusLabel.text = chorus

    }
    

  

}

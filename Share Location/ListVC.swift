//
//  ListVC.swift
//  Share Location
//
//  Created by Crystal-Logic on 28/02/17.
//  Copyright © 2017 Crystal-Logic. All rights reserved.
//

import UIKit

class List: UIViewController
{
   
    @IBOutlet weak var tableViewList: ListTableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableViewList.reloadData()
    }
    
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

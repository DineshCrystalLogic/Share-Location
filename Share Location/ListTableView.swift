//
//  ListTableView.swift
//  Share Location
//
//  Created by Crystal-Logic on 28/02/17.
//  Copyright © 2017 Crystal-Logic. All rights reserved.
//

import UIKit

class ListTableView: UITableView,UITableViewDelegate,UITableViewDataSource
{

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.delegate = self
        self.dataSource = self
    }
    //MARK: TABALE VIEW DELEGATE METHODS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath)
        
        return cell
    }

}

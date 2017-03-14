//
//  ListTableView.swift
//  Share Location
//
//  Created by Crystal-Logic on 28/02/17.
//  Copyright © 2017 Crystal-Logic. All rights reserved.
//

import UIKit
import SwiftyJSON

class View_LocationList: UITableView,UITableViewDelegate,UITableViewDataSource
{

   var dataSourceArray = [user]()
    
    required init?(coder aDecoder: NSCoder)
    {
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
        return self.dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:CellLocationList = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellLocationList
        
        let myUser = self.dataSourceArray[indexPath.row]
       // cell.BackgroundImagView?.image = UIImage(named: "nature")
        cell.BackgroundImagView.setRandomDownloadImage(Int(cell.BackgroundImagView.frame.width), height: Int(cell.BackgroundImagView.frame.height))
        cell.profilePicture.setRandomDownloadImage(Int(cell.profilePicture.frame.width), height: Int(cell.profilePicture.frame.height))
        cell.Namelbl.text = myUser.Name
        cell.MobileLbl.text = myUser.phone
        cell.btnCall.tag = indexPath.row
        cell.btnCall?.addTarget(self, action:#selector(btnMakeCall(_:)), for:.touchUpInside)
        
        cell.btnEmailVerifiedOrNot.tag = indexPath.row
        cell.btnEmailVerifiedOrNot?.addTarget(self, action:#selector(btnEmailVerifiedOrNot(_:)), for:.touchUpInside)
        
        return cell
    }
    
    //MAKR:UIButton Actions
    func btnMakeCall(_ sender: AnyObject)
    {
        let button = sender as? UIButton
        
        print(button?.tag ?? "null")
    }
    
    func btnEmailVerifiedOrNot(_ sender: AnyObject)
    {
        let button = sender as? UIButton
        
        print(button?.tag ?? "null")
    }
 
}

//
//  user.swift
//  Share Location
//
//  Created by Crystal-Logic on 09/03/17.
//  Copyright © 2017 Crystal-Logic. All rights reserved.
//

import SwiftyJSON

class user
{
    var Name = String()
    var Email = String()
    var phone = String()
    
    //var addree = userAddress()
    
    init (userJSON:JSON)
    {
        self.Name = userJSON["name"].stringValue
        self.Email = userJSON["email"].stringValue
        self.phone = userJSON["phone"].stringValue
        
        //self.addree = addressJSON(userJSON[""])
    }
    



class userAddress
{
    var street = String()
    var suite = String()
    var city = String()
    
    
    init(_ addressJSON:JSON)
    {
        self.street = addressJSON["street"].stringValue
        self.suite = addressJSON["suite"].stringValue
        self.city = addressJSON["city"].stringValue
    }
}

class geoGraphicalLatLong
{
    var latitude = String()
    var langitude = String()
    
    init(LatLongJSON:JSON)
    {
        self.latitude = LatLongJSON["lat"].stringValue
        self.langitude = LatLongJSON["log"].stringValue
    }
}

class Company
{
    var name = String()
    var catchPhrase = String()
    var bs = String()
    
    init(companyJSON:JSON)
    {
        self.name = companyJSON["name"].stringValue
        self.catchPhrase = companyJSON["catchPhrase"].stringValue
        self.bs = companyJSON["bs"].stringValue
    }
}
}

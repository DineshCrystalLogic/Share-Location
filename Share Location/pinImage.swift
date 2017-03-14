//
//  pinImage.swift
//  Share Location
//
//  Created by Crystal-Logic on 07/03/17.
//  Copyright © 2017 Crystal-Logic. All rights reserved.
//

import UIKit

class pinImage : UIImageView
{
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        setRandomDownloadImage(30, height: 30)
    }
}

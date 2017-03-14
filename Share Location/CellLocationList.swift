//
//  CellLocationList.swift
//  Share Location
//
//  Created by Crystal-Logic on 01/03/17.
//  Copyright © 2017 Crystal-Logic. All rights reserved.
//

import UIKit

class CellLocationList: UITableViewCell
{
    //MARK: Cell content IBOUTLETS
    
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var BackgroundImagView: UIImageView!
    @IBOutlet weak var Namelbl: UILabel!
    @IBOutlet weak var MobileLbl: UILabel!
    @IBOutlet weak var lblEmailID: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var btnCall: UIButton!
    @IBOutlet weak var btnEmailVerifiedOrNot: UIButton!
    
    
   override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        // Set the shadow to the tableview cell
        
        profilePicture.layer.borderWidth = 1.10
        profilePicture.layer.borderColor = UIColor.white.cgColor
        
        cellBackgroundView.layer.borderWidth = 1.10
        cellBackgroundView.layer.borderColor = UIColor.white.cgColor
        
        cellBackgroundView.layer.shadowColor   = UIColor.black.cgColor
        cellBackgroundView.layer.shadowOpacity = 1
        cellBackgroundView.layer.shadowOffset  = CGSize.zero
        cellBackgroundView.layer.shadowRadius  = 5

    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

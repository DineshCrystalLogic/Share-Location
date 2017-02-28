//
//  ViewController.swift
//  Share Location
//
//  Created by Crystal-Logic on 28/02/17.
//  Copyright © 2017 Crystal-Logic. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    //MARK:IBOUTLETS
    @IBOutlet weak var MAPContainerView: UISegmentedControl!

    @IBOutlet weak var MAPContainer: UIView!
    @IBOutlet weak var LISTContainer: UIView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func showComponent(sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0
        
        {
            UIView.animate(withDuration: 0.5, animations:
                {
                self.MAPContainer.alpha = 1
                self.LISTContainer.alpha = 0
            })
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations:
                {
                self.MAPContainer.alpha = 0
                self.LISTContainer.alpha = 1
            })
        }
    }
    

}


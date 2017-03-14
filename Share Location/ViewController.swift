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
    @IBOutlet weak var barBtnMenu: UIBarButtonItem!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.DeviseRegistration()
        self.MAPContainer.alpha = 1
        self.LISTContainer.alpha = 0
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }

    //MARK: Menu Button
//    @IBAction func menuButton(_ sender: Any)
//    {
//        slideMenuController()?.toggleRight()
//    }
    
    //MARK: Registor Devise id
    func DeviseRegistration() -> Void
    {
        let parameter = [
            "MobileType":"iOS",
            "DeviceID":DEVICE_ID,
            ]
        
        AFWrapper.requestPOSTURL("\(BASEURL)/Devices", params: parameter as [String : AnyObject]?, headers: HEADER, success: {
            (JSONResponse) -> Void in
            print("+++++++++++++++++++++++")
            print("\(JSONResponse)")
            print("+++++++++++++++++++++++")
            
            
            let  base64Encoded = "QkxBTktQQVJBTQ=="
            let data = NSData(base64Encoded: base64Encoded, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
            // Convert back to a string
            let base64Decoded = NSString(data: data as! Data, encoding: String.Encoding.utf8.rawValue)
            print("Decoded:  \(base64Decoded)")
            
            
        }, failure: {
            (JSONResponse) -> Void in
            print("+++++++++++++++++++++++")
            print("\(JSONResponse)")
            print("+++++++++++++++++++++++")
           
            
        })
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
extension ViewController : SlideMenuControllerDelegate
{
    
    func leftWillOpen()
    {
        print("SlideMenuControllerDelegate: leftWillOpen")
    }
    
    func leftDidOpen()
    {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    func leftWillClose()
    {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    func leftDidClose()
    {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    func rightWillOpen()
    {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    func rightDidOpen()
    {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    func rightWillClose()
    {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    func rightDidClose()
    {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
}


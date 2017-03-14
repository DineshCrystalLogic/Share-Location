//
//  ProfileVC.swift
//  Share Location
//
//  Created by Crystal-Logic on 14/03/17.
//  Copyright © 2017 Crystal-Logic. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate
{

    /************OUTLETS*******
     *                        *
     * HERE SET ALL OUTLETS   *
     *                        *
     **************************/
    @IBOutlet weak var imgViewProfilePhoto: UIImageView!
    
    /************VARIALBLS*****
     *                        *
     * HERE SET ALL VARIALBLS *
     *                        *
     **************************/
    let picker = UIImagePickerController()
    
    //MARK: VIWE DID LOAD
    override func viewDidLoad()
    {
        super.viewDidLoad()
         picker.delegate = self
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgViewProfilePhoto.isUserInteractionEnabled = true
        imgViewProfilePhoto.addGestureRecognizer(tapGestureRecognizer)
       
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
        
    }
    
    // MARK: - UITapGestureRecognizer
    /*
     * Here call the tapgesture to show the Action sheet
     *
     */
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        print("tap gesture working")
        // Your action
        // 1
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        // 2
        let deleteAction = UIAlertAction(title: "Camera", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("camera")
            self.camera()
        })
        let saveAction = UIAlertAction(title: "Photo Gallery", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("photoLibrary")
            self.photoLibrary()
        })
        
        //
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        
        // 4
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        // 5
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    /*
     *
     *  Call Camera
     *
     **/
    func camera()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            present(picker,animated: true,completion: nil)
        } else {
            noCamera()
        }
        
    }
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
    
    /*
     *
     *  Call Photo Gallery
     *
     **/
    
    func photoLibrary()
    {
        
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(picker, animated: true, completion: nil)
        
    }
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    @nonobjc public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imgViewProfilePhoto.image = image
        } else{
            print("Something went wrong")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Memory warning

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    

}

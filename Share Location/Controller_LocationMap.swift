//
//  Controller_LocationMap.swift
//  Share Location
//
//  Created by Crystal-Logic on 01/03/17.
//  Copyright © 2017 Crystal-Logic. All rights reserved.
//

import UIKit
import GoogleMaps

class Controller_LocationMap: UIViewController,GMSMapViewDelegate
{

    var mapView: GMSMapView!
    var london: GMSMarker?
    var londonView: UIImageView?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        let camera = GMSCameraPosition.camera(withLatitude: 51.5,
                                              longitude: -0.127,
                                              zoom: 14)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        view = mapView
        
        mapView.delegate = self
        
        let house = UIImage(named: "Loc_pin")!.withRenderingMode(.alwaysTemplate)
        let markerView = UIImageView(image: house)
        markerView.tintColor = .red
        londonView = markerView
        
        let position = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.127)
        let marker = GMSMarker(position: position)
        marker.title = "London"
        marker.iconView = markerView
        marker.tracksViewChanges = true
        marker.map = mapView
        london = marker
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        UIView.animate(withDuration: 5.0, animations: { () -> Void in
            self.londonView?.tintColor = .blue
        }, completion: {(finished) in
            // Stop tracking view changes to allow CPU to idle.
            self.london?.tracksViewChanges = false
        })
    }
   
   
    
    
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    


}


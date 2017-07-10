//
//  RentPlaceViewController.swift
//  shareiOS
//
//  Created by Mac on 2017/7/9.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Firebase
import FirebaseAuth
import FirebaseDatabase



class RentPlaceViewController: UIViewController, UISearchBarDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var searchController:UISearchController!
    var annotation:MKAnnotation!
    var localSearchRequest:MKLocalSearchRequest!
    var localSearch:MKLocalSearch!
    var localSearchResponse:MKLocalSearchResponse!
    var error:NSError!
    var pointAnnotation:MKPointAnnotation!
    var pinAnnotationView:MKPinAnnotationView!
    
    
    var locationManager: CLLocationManager!
    
    let locationsRef = FIRDatabase.database().reference(withPath: "Locations")
    
    var uid = ""

    @IBOutlet weak var map: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = FIRAuth.auth()?.currentUser {
            uid = user.uid
        }
        
        
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        
        
        let coordinate = locationManager.location?.coordinate
        print("緯度: \(coordinate?.latitude)")
        print("經度: \(coordinate?.longitude)")
        
        let latDelta: CLLocationDegrees = 0.01
        let lonDelta: CLLocationDegrees = 0.01
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        if coordinate != nil{
            let region: MKCoordinateRegion = MKCoordinateRegionMake(coordinate!, span)
            map.setRegion(region, animated: true)
            
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.activityType = .automotiveNavigation
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        map.userTrackingMode = .followWithHeading
        
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate!

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let coordinate = locations[0].coordinate
        print("緯度: \(coordinate.latitude)")
        print("經度: \(coordinate.longitude)")
        
        
    }

    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        
        
        let touchPoint = sender.location(in: self.map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        
        print("插針位置 \(annotation.coordinate.latitude)")
        print("插針位置 \(annotation.coordinate.longitude)")
        map.addAnnotation(annotation)

        
        let uniqueString = NSUUID().uuidString
        
        FIRDatabase.database().reference(withPath: "RentLocation/\(self.uid)").child(uniqueString).child("Latitude").setValue(annotation.coordinate.latitude)
        
        FIRDatabase.database().reference(withPath: "Location/\(self.uid)").child(uniqueString).child("Longitude").setValue(annotation.coordinate.longitude)
        
        
        let alert = UIAlertController(title: "取還車位置", message: "請確認取還車為此長按位置", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "RentNavigationID")
            self.present(newViewController, animated: true, completion: nil)
            
            print("Cancel")
        }
        let okAction = UIAlertAction(title: "確認", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "RentDetailViewControllerID")
            self.show(newViewController, sender: self)
            

            print("OK")
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

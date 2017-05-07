//
//  AddCarMapViewController.swift
//  shareiOS
//
//  Created by Mac on 2017/5/2.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Firebase
import FirebaseAuth
import FirebaseDatabase

class AddCarMapViewController: UIViewController, UISearchBarDelegate, MKMapViewDelegate, CLLocationManagerDelegate {

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
    
    @IBOutlet weak var mapView: MKMapView!
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
            mapView.setRegion(region, animated: true)
            
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.activityType = .automotiveNavigation
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        mapView.userTrackingMode = .followWithHeading
        
        
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
    
    @IBAction func showSearchBar(_ sender: Any) {
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
        
    }

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        //1
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        if self.mapView.annotations.count != 0{
            annotation = self.mapView.annotations[0]
            self.mapView.removeAnnotation(annotation)
        }
        //2
        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = searchBar.text
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start { (localSearchResponse, error) -> Void in
            
            if localSearchResponse == nil{
                let alertController = UIAlertController(title: nil, message: "Place Not Found", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
            //3
            self.pointAnnotation = MKPointAnnotation()
            self.pointAnnotation.title = searchBar.text
            self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude:     localSearchResponse!.boundingRegion.center.longitude)
            
            
            self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
            self.mapView.centerCoordinate = self.pointAnnotation.coordinate
            self.mapView.addAnnotation(self.pinAnnotationView.annotation!)
        }
    }
    
    

    
    @IBAction func longPressAction(sender: UILongPressGestureRecognizer) {
        
        
        let touchPoint = sender.location(in: self.mapView)
        let coordinate = mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        
        print("插針位置 \(annotation.coordinate.latitude)")
        print("插針位置 \(annotation.coordinate.longitude)")
        
        
        FIRDatabase.database().reference(withPath: "Location/\(self.uid)").child("Latitude").setValue(annotation.coordinate.latitude)

        FIRDatabase.database().reference(withPath: "Location/\(self.uid)").child("Longitude").setValue(annotation.coordinate.longitude)

        
        
        mapView.addAnnotation(annotation)
        
        

        
        
        
    }
    
    
    
    @IBAction func confirm(_ sender: Any) {
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let nextVC = storyboard.instantiateViewController(withIdentifier: "AddCarThreeViewControllerID")as! AddCarThreeViewController
//        self.present(nextVC,animated:true,completion:nil)

        
        
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

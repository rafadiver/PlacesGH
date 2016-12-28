//
//  MapViewController.swift
//  Places
//
//  Created by Maria Susana Moline Venanzi on 12/11/16.
//  Copyright © 2016 Uberbliss. All rights reserved.
//




import UIKit
import CoreLocation
import MapKit

// import MapKit


class MapViewController: UIViewController {

   var place: Place!
    
    @IBOutlet var mapView: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    
        self.mapView.delegate = self
        self.mapView.showsTraffic = true
        self.mapView.showsScale = true
        self.mapView.showsCompass = true
    
        
        
        
       print("el mapa debe mostrar" + place.name)
        
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(place.location) { [unowned self] (placemarks, error) in
    
            if error == nil {
                for placemark in placemarks! {
                    print (placemark)
                    
                    let annotation = MKPointAnnotation()
                    annotation.title = self.place.name
                    annotation.subtitle = self.place.type
                    annotation.coordinate = (placemark.location?.coordinate)!
                    
                    self.mapView.showAnnotations( [annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                    
                    
                }
            } else {
                print("ha habido un error: \(error?.localizedDescription)")
            }
        
        
    }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    
    override var prefersStatusBarHidden: Bool {
       return true
   }
    
}



extension MapViewController : MKMapViewDelegate {
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        
        let identifier = "MyPin"
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        var anotationView : MKPinAnnotationView? = self.mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        if anotationView == nil {
            anotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            anotationView?.canShowCallout = true
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 52, height: 52))
        imageView.image = UIImage(data: self.place.image! as Data)
        //(data: self.place.image! as Data)
        anotationView?.leftCalloutAccessoryView = imageView
        
        anotationView?.pinTintColor = UIColor.blue
        
        return anotationView
    }
    
}



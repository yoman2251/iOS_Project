//
//  ViewController.swift
//  HelloMap
//
//  Created by sunny on 2019/5/24.
//  Copyright © 2019 sunny. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //經度
        let longitude:CLLocationDegrees = 121.5319862
        //緯度
        let latitude:CLLocationDegrees = 25.0423371
        //經度，緯度產生座標
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        //直向縮放
        let latDelte:CLLocationDegrees = 0.01
        //橫向縮放
        let lonDelte:CLLocationDegrees = 0.01
        //直向縮放，橫向縮放產生縮放範圍
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelte, longitudeDelta: lonDelte)
        //座標，縮放範圍產生顯示範圍
        let region = MKCoordinateRegion(center: coordinate, span: span)
        //讓地圖顯示
        mapView.setRegion(region, animated: true)
        
        //大頭針
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "臺北科技大學"
        mapView.addAnnotation(annotation)

    }


}


//
//  ViewController.swift
//  PedestrianSafety
//
//  Created by Jonathan Leung on 2017-10-21.
//  Copyright © 2017 jonathan. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController2: UIViewController, GMUClusterManagerDelegate, GMSMapViewDelegate {
    
    
    private var mapView: GMSMapView!
    private var clusterManager: GMUClusterManager!
    public var markers: [String: GMSMarker] = [:]
    public var labels: [String: UILabel] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 32.71353424760151, longitude: -117.15733600802361, zoom: 17.0)
        
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let locationArray = [
            "30-1081-2-S,32.71161491892138,-117.15840766880272",
            "30-1081-1-E,32.71160957692031,-117.15822316421646",
            "30-1050-2-S,32.7116040028346,-117.15755153356945",
            "30-1037-1-W,32.71141079185926,-117.15750341919822",
            "30-1040-2-S,32.71160777191002,-117.1575069651737",
            "30-1042-2-S,32.711416903736136,-117.15659277760504",
            "30-1042-1-E,32.71165796608028,-117.15642400072348",
            "30-1047-2-S,32.71141543663326,-117.15641896377123",
            "30-1082-2-S,32.712524591295434,-117.1566010699227",
            "30-1082-1-E,32.7127041941234,-117.15643466416701",
            "30-1041-2-N,32.712663552803086,-117.15729980460442",
            "30-1030-2-W,32.71255813099456,-117.1575156723285",
            "30-1039-2-S,32.712668000008804,-117.15751607228526",
            "30-1052-2-E,32.71252029252331,-117.1573459786929",
            "30-1054-2-N,32.71270592693333,-117.15820887424537",
            "30-1046-2-E,32.71247999322275,-117.15824557116326",
            "30-1046-1-N,32.71251416744852,-117.15845934095843",
            "30-1065-2-E,32.71352447341508,-117.15933370352916",
            "30-1065-1-N,32.7136857384784,-117.15912529828589",
            "30-1018-2-W,32.71373322887651,-117.1582672566644",
            "30-1018-1-S,32.7137706783941,-117.15825327843524",
            "30-1070-2-E,32.71353424760151,-117.15733600802361",
            "30-1073-2-S,32.71370603839241,-117.1575195526309",
            "30-1071-2-S,32.71371280542716,-117.156643996094057",
            "30-1064-1-S,32.71359298565844,-117.15638943252002",
            "30-1063-2-W,32.71475732519035,-117.15661999741705",
            "30-1074-2-W,32.7147590542427,-117.15736025010217",
            "30-1074-1-S,32.71455905427172,-117.15731749496842",
            "30-1017-2-S,32.71475338914596,-117.15752938316258",
            "30-1066-2-W,32.714791506783584,-117.1584435201585",
            "30-1077-2-E,32.71566385135297,-117.15753098610212",
            "30-276,32.713559146936475,-117.1575695042523",
            "30-225,32.71355914700175,-117.15825357535282",
            "30-229,32.71377263680952,-117.15844062624548",
            "30-233,32.71353914700175,-117.15847803640075"]
        
        for location in locationArray
        {
            let split = location.components(separatedBy: ",")
            let lat = Double(split[1])!
            let long = Double(split[2])!
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
            marker.title = split[0]
            let customIcon = UIImage.circle(diameter: 50.0, color: UIColor.yellow)
            let customIconView = UIImageView(image: customIcon)
            let label = UILabel()
            label.text = "200"
            label.frame = CGRect(x: (customIconView.bounds.size.width/2)-14,y: 15, width: customIconView.bounds.size.width, height: customIconView.bounds.size.height)
            label.textAlignment = .center
            label.sizeToFit()
            label.textColor = UIColor.black
            labels[split[0]] = label
            customIconView.addSubview(label)
            marker.iconView = customIconView
            marker.opacity = 0.6
            markers[split[0]] = marker
            marker.map = mapView
        }
        
        
    }
    
}


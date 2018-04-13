//
//  ViewControllerMapView.swift
//  testURL
//
//  Created by Qooo on 08/04/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import UIKit
import MapKit

class ViewControllerMapView: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var entry: Entry?
    var line: String = ""
    
    @IBOutlet weak var myMapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("category is \(String(describing: entry?.category))")
//        print("summary is \(String(describing: entry?.summary))")
        
        myMapView.delegate = self
        
        //將縣市過濾出來
        if var line = entry?.summary {
            var strSearch = "台灣"
            switch line {
            case let x where x.contains("縣"):
                strSearch = "縣"
            case let x where x.contains("市"):
                strSearch = "市"
            case let x where x.contains("鄉"):
                strSearch = "鄉"
            case let x where x.contains("線"): //鐵路
                strSearch = "線"
            default:
                break
            }
            if strSearch != "台灣" {
                let result = line.range(of: strSearch, options: NSString.CompareOptions.literal, range: line.startIndex..<line.endIndex, locale: nil)
                if let range = result {
                    let strSearchStartIndex = range.lowerBound
                    let strSearchEndIndex = line.index(strSearchStartIndex, offsetBy: strSearch.count-3)
                    line.removeSubrange(line.startIndex..<strSearchEndIndex)
                    let strEnd = line.index(line.startIndex, offsetBy: 3)
                    line.removeSubrange(strEnd..<line.endIndex)
                    self.line = line
                    print("KeyWord is \(line)")
                } else { print("找不到縣市") }
            } else { self.line = "台灣" }
        }
        
        //地址轉座標
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(line, completionHandler: { placemarks, error in
            if error != nil {
                print(error!)
                return
            }
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                
                //定義大頭針
                //self.myMapView.removeAnnotation(self.myMapView.annotations as! MKAnnotation)
                let annotation = MKPointAnnotation()
                annotation.title = self.entry?.category
                //annotation.subtitle = self.entry?.summary
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    //self.myMapView.showAnnotations([annotation], animated: true)
//                    print(annotation.coordinate)
                    self.myMapView.addAnnotation(annotation)
                    if self.line != "台灣" {
                        let region = MKCoordinateRegion(center: annotation.coordinate,
                                                        span: MKCoordinateSpan(latitudeDelta: 1.5, longitudeDelta: 1.5))
                        self.myMapView.setRegion(region, animated: false)
                    } else {
                        let region = MKCoordinateRegion(center: annotation.coordinate,
                                                        span: MKCoordinateSpan(latitudeDelta: 2.5, longitudeDelta: 2.5))
                        self.myMapView.setRegion(region, animated: false)
                    }
                    self.myMapView.selectAnnotation(annotation, animated: true)
                }
            }
        })
    }
    
    //MARK: MKMapViewDelegate 實作：自訂大頭針樣式
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation {
//            return nil  //如果是目前位置的大頭針, 則不更動樣式
//        }
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        //用"Pin"ID來取得大頭針樣式（注意：不要轉型為預設大頭針，使用一般型的大頭針樣式）
        var annView = mapView.dequeueReusableAnnotationView(withIdentifier: "Pin") as? MKPinAnnotationView
        if annView == nil {
//            annView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
            annView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
            annView?.canShowCallout = true
            annView?.pinTintColor = UIColor.blue
        }
        
        
        
        //pop左側Icon
        //        let leftIconView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 53, height: 53))
        //        leftIconView.image = UIImage(named: "mi")
        //        annView?.leftCalloutAccessoryView = leftIconView
        
        //callout labal at detailCalloutAccessoryView
        let label = UILabel()
        label.numberOfLines = 10 //Label的文字行數
        label.text = entry?.summary
        label.font = UIFont.boldSystemFont(ofSize: 14)
        annView?.detailCalloutAccessoryView = label
        
        annView?.canShowCallout = true
        return annView //回傳樣式
    }
    
    
}



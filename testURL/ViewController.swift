//
//  ViewController.swift
//  testURL
//
//  Created by KaiChieh on 09/02/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
// https://alerts.ncdr.nat.gov.tw/RSS.aspx
// https://www.cnswift.org/working-with-json-in-swift.html

import UIKit

class ViewController: UIViewController {

    // MARK: - Network methods
    func loadSynchronouslyFromURLString(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = NSMutableURLRequest(url: url)
            request.timeoutInterval = 30.0
            var response: URLResponse?
            let error: NSErrorPointer? = nil
            var data: Data?
            do {
                data = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: &response)
            } catch let error1 as NSError {
                error??.pointee = error1
                data = nil
            }
            if (data != nil) {
                print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!)
                //            return UIImage(data: data!)
            }
        }
        //    return nil
    }
    func loadURLData(_ urlString: String) {
        let dataURL = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: dataURL!) { (data, response, error) in
            if error == nil {
                if let jsonsObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String : Any] {
                    if let json = jsonsObj["title"] as? String {
                        print(json)
                    }
                    if let json = jsonsObj["author"] as? [String : String] {
                        for (key, value) in json {
                            print(value)
                        }
                    }
                }
            }
        }
        task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadURLData("https://alerts.ncdr.nat.gov.tw/JSONAtomFeeds.ashx")
//        loadSynchronouslyFromURLString("https://alerts.ncdr.nat.gov.tw/JSONAtomFeeds.ashx")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


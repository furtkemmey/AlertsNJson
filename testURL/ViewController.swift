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
    var ncdr: NCDRRoot?
    // MARK: - Network methods
    
    @IBAction func buttonClick(_ sender: UIButton) {
    }
    @IBAction func buttonClick2(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        ncdr = NCDRRoot()
//        ncdr?.getDataFromInternet(URLString: "https://alerts.ncdr.nat.gov.tw/JSONAtomFeeds.ashx")
        getDataFromInternet(URLString: "https://alerts.ncdr.nat.gov.tw/JSONAtomFeeds.ashx")
    }

    func getDataFromInternet(URLString: String) {
        let url = URL(string: URLString)!
        let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
            
            if let data = data {
                let jsonDicObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : Any]
                //root
                if let title = jsonDicObj!["title"] as? String {
                    print("Root title= \(title)")
                }
                //entry
                if let entries = jsonDicObj!["entry"] as? [[String : Any]] {

                    for entry in entries {
                        //id
                        if let idString = entry["id"] as? String {
                            print("ID= \(idString)")
                        }
                        //title
                        if let title = entry["title"] as? String {
                            print("Title= \(title)")
                        }
                        //summary
                        if let summary = entry["summary"] as? [String : String] {
                            print("Summary= \(summary["#text"])")
                        }
                        //updated
                        if let updated = entry["updated"] as? String {
                            print("Updated= \(updated)")
                        }
                        print("-----------------------------------------")
                        
                    }
                }
            } else {
                print("Error...")
            }
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


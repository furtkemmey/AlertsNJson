//
//  JSONData.swift
//  testURL
//
//  Created by HsuKaiChieh on 09/02/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import Foundation

class AlertJson: NSObject {
    var idString: [String]?
    var title: [String]?
    var entries: [Entry]?
    var summary: [String]?
    var updated: [String]?
    

    init?(URLString: String) {
        super.init()
        idString = [String]()
        title = [String]()
        summary = [String]()
        updated = [String]()
        if !(self.getDataFromInternet(URLString: URLString)) {
            return nil
        }
    }
    
    func getDataFromInternet(URLString: String) -> Bool {

        if let url = URL(string: URLString) {
            let task = URLSession.shared.dataTask(with: url) {[weak self] (data, response , error) in
                
                if let data = data {
                    guard let jsonDicObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any] else {
                         return
                    }
                    
                    //root
                    if let title = jsonDicObj!["title"] as? String {
                        print("Root title= \(title)")
                    }
                    //entry
                    if let entries = jsonDicObj!["entry"] as? [[String : Any]] {
                        
                        for entry in entries {
                            //id
                            if let idString = entry["id"] as? String {
                                self?.idString?.append(idString)
                                print("ID= \(idString)")
                            }
                            //title
                            if let title = entry["title"] as? String {
                                self?.title?.append(title)
                                print("Title= \(title)")
                            }
                            //summary
                            if let summary = entry["summary"] as? [String : String] {
                                self?.summary?.append(summary["#text"]!)
    //                            print("Summary= \(summary["#text"])")
                            }
                            //updated
                            if let updated = entry["updated"] as? String {
                                self?.updated?.append(updated)
    //                            print("Updated= \(updated)")
                            }
    //                        print("-----------------------------------------")
                            
                        }
                    }
                } else {
                    print("Error...")
                }
            }//end URLSession.shared.dataTask
            task.resume()
        } else {//end if let url = URL
            return false
        }
        return true
    }
}
struct Entry {

}

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
struct NCDRRoot {
    
//    var dataLists: RootClass?
////    let decoder = JSONDecoder()
//
//    mutating func getDataFromInternet(URLString: String) {
//        let url = URL(string: URLString)!
////        let selfCopy = self//to avoid cannt catch self
//        let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
//
//            if let data = data, let dataList = try? JSONDecoder().decode(RootClass.self, from: data) {
//
//
//                print(dataList.title)
//                print(dataList.updated)
//                if dataList.entry != nil {
//                    for entryi in (dataList.entry!) {
//                        print("id= \(entryi.id)")
//                        print("title= \(entryi.title)")
//                        print("summary.text= \(entryi.summary)")
//                    }
//                }
//            } else {
//                print("Error...")
//            }
//        }
//        task.resume()
//    }
}

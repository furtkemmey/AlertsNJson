//
//  JSONData.swift
//  testURL
//
//  Created by HsuKaiChieh on 09/02/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import Foundation

struct NCDRRoot {
    var dataLists: RootClass?
//    let decoder = JSONDecoder()
    
    mutating func getDataFromInternet(URLString: String) {
        let url = URL(string: URLString)!
//        let selfCopy = self//to avoid cannt catch self
        let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
            
            if let data = data, let dataList = try? JSONDecoder().decode(RootClass.self, from: data) {

                
                print(dataList.title)
                print(dataList.updated)
                if dataList.entry != nil {
                    for entryi in (dataList.entry!) {
                        print("id= \(entryi.id)")
                        print("title= \(entryi.title)")
                        print("summary.text= \(entryi.summary)")
                    }
                }
            } else {
                print("Error...")
            }
        }
        task.resume()
    }
}

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
    var alertJson: AlertJson?
    
    // MARK: - Network methods
    // FIXME: Cannt get data
    @IBAction func buttonClick(_ sender: UIButton) {
//        alertJson = AlertJson(URLString: "https://alerts.ncdr.nat.gov.tw/JSONAtomFeeds.ashx")
        if alertJson != nil {
            for summString in alertJson!.summary! {
                print("summString= \(summString)")
            }
        }
    }
    @IBAction func buttonClick2(_ sender: UIButton) {
        printLog("printLog test")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        alertJson = AlertJson(URLString: "https://alerts.ncdr.nat.gov.tw/JSONAtomFeeds.ashx")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ViewController {
    func printLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line){
        #if DEBUG
//            print("\((file as NSString).lastPathComponent)-> \(method)(\(line)): \(message)")
            debugPrint("Line:\(line) \(method)(): \(message)")
        #else
            print("Line:\(line) \(method)(): \(message)")
        #endif
    }
}


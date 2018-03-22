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
    
    
    
    // MARK: - IBAction
    @IBAction func buttonClick(_ sender: UIButton) {
        let userDefaultDic = UserDeaultCategoryNSynchronize()
//        if let dic = userDefaultDic.dicCategoryRootKye  {
            for (dicKey,dicValue) in userDefaultDic.dicCategoryRootKye {
                print("key = \(dicKey) \(dicValue)")
            }
//        }

    }
    @IBAction func buttonClick2(_ sender: UIButton) {
        
//        printLog("printLog test \(userDefault.bool(forKey: userName) )")
        
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        alertJson = AlertJson(URLString: "https://alerts.ncdr.nat.gov.tw/JSONAtomFeeds.ashx")
        alertJson = AlertJson(URLString: "http://192.168.192.154:3000/JSONFeeds2")
        alertJson?.delegate = self
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
extension ViewController: AlertJSONDelegate {
    func AlertJSON(_ alertJSON: AlertJson?, didLoad feeds: AlertFeeds?, and entry: [Entry]?) {
        printLog("AlertJSONDelegate call")
        printLog("\(String(describing: feeds))")
    }
}



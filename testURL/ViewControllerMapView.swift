//
//  ViewControllerMapView.swift
//  testURL
//
//  Created by KaiChieh on 30/03/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import UIKit

class ViewControllerMapView: UIViewController {
    var entry: Entry?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("map view entry is \(entry?.summary)")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

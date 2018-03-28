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
    var entry: Entry?


    // MARK: - IBOutlet
    @IBOutlet weak var outletTextView: UITextView!
    @IBOutlet weak var outletButton: UIButton!

    // MARK: - IBAction
    @IBAction func buttonClick(_ sender: UIButton) {
        print("outletButton.titleLabel?.text = \(sender.currentTitle)")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        outletTextView.text = entry?.summary
        outletButton.setTitle(entry?.title, for: .normal)

    }
    override func viewWillAppear(_ animated: Bool) {
    }


}

//
//  ViewControllerAbout.swift
//  testURL
//
//  Created by KaiChieh on 30/03/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import UIKit

class ViewControllerAbout: UIViewController {
    @IBOutlet weak var btnLeft: UIButton!

    override func viewWillAppear(_ animated: Bool) {
        btnLeft.shake()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
extension UIView {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = [self.center.x - 20.0, self.center.y]
        //        animation.fromValue = NSValue(CGPoint: CGPointMake(self.center.x - 4.0, self.center.y))
        //        animation.toValue = NSValue(CGPoint: CGPointMake(self.center.x + 4.0, self.center.y))
        animation.toValue = [self.center.x + 20.0, self.center.y]
        layer.add(animation, forKey: "position")
    }
}

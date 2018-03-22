//
//  EventCode.swift
//  testURL
//
//  Created by HsuKaiChieh on 22/03/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import Foundation

let userDefault = UserDefaults.standard
let CategorRootKye = ["earthquake","debrisFlow","tsunami",
                      "Typhoon","debrisFlow","flood",
                      "highWater","coldSurge","denseFog",
                      "strongWind","Thunderstorm","highwater",
                      "airRaidAlert","communicable","railIncident",
                      "roadClose","Parking","workSchlClos",
                      "ReservoirDis","GatesInfo"
    
                    ]
struct UserDeaultCategoryNSynchronize {
    var dicCategoryRootKye = [String : Bool]()
    init() {
        for key in CategorRootKye {
//            dicCategoryRootKye[key] = false
            dicCategoryRootKye.updateValue(false, forKey: key)
        }
    }
    mutating func getDataFromUserDefault(){
//        self.earthquake = userDefault.bool(forKey: CategoryRootKey.earthquake)
    }
    mutating func backDataToUserDefault(){
        //        userDefault.set(true, forKey: userName)
        //        userDefault.synchronize()
    }

}
//struct CategoryRootKey {
//    static let earthquake = "earthquake"
//    static let debrisFlow = "debrisFlow"
//    static let tsunami = "tsunami"
//
//    static let Typhoon = "Typhoon"
//    static let rainfall = "debrisFlow"
//    static let flood = "flood"
//    static let highWater = "highWater"
//    static let coldSurge = "coldSurge"
//    static let denseFog = "denseFog"
//    static let strongWind = "strongWind"
//    static let Thunderstorm = "Thunderstorm"
//    static let highwater = "highwater"
//
//    static let airRaidAlert = "airRaidAlert"
//
//    static let communicable = "communicable"
//
//    static let railIncident = "railIncident"
//    static let roadClose = "roadClose"
//    static let Parking = "Parking"
//
//    static let workSchlClos = "workSchlClos"
//    static let ReservoirDis = "ReservoirDis"
//    static let GatesInfo = "GatesInfo"
//}


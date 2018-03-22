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
            dicCategoryRootKye.updateValue(false, forKey: key)
        }
        //default value
        dicCategoryRootKye.updateValue(true, forKey: Cateory.earthquake.rawValue)
        dicCategoryRootKye.updateValue(true, forKey: Cateory.Typhoon.rawValue)
        dicCategoryRootKye.updateValue(true, forKey: Cateory.workSchlClos.rawValue)
        self.getDataFromUserDefault()
    }
    mutating func getDataFromUserDefault() {
        for (key,_) in dicCategoryRootKye {
            let value  = userDefault.bool(forKey: key)
            dicCategoryRootKye.updateValue(value, forKey: key)
        }
    }
    mutating func backDataToUserDefault() {
        for (key,value) in dicCategoryRootKye {
            userDefault.set(value, forKey: key)
        }
        userDefault.synchronize()
    }
    mutating func update(value: Bool, forKey: Cateory) {
        userDefault.set(value, forKey: forKey.rawValue)
    }
    func getDate(fromkey: Cateory ) -> Bool? {
        return userDefault.bool(forKey: fromkey.rawValue)
    }
}
enum Cateory: String {
    case earthquake = "earthquake"
    case debrisFlow = "debrisFlow"
    case tsunami = "tsunami"
    
    case Typhoon = "Typhoon"
    case rainfall = "rainfall"
    case flood = "flood"
    case highWater = "highWater"
    case coldSurge = "coldSurge"
    case denseFog = "denseFog"
    case strongWind = "strongWind"
    case Thunderstorm = "Thunderstorm"
    case highwater = "highwater"
    
    case airRaidAlert = "airRaidAlert"
    
    case communicable = "communicable"
    
    case railIncident = "railIncident"
    case roadClose = "roadClose"
    case Parking = "Parking"
    
    case workSchlClos = "workSchlClos"
    case ReservoirDis = "ReservoirDis"
    case GatesInfo = "GatesInfo"
}


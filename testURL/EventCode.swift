//
//  EventCode.swift
//  testURL
//
//  Created by HsuKaiChieh on 22/03/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import Foundation

let userDefault = UserDefaults.standard

struct UserDeaultCategoryNSynchronize {
    var dicCategoryRootKye = [String : Bool]()
    let CategorRootKye = [Cateory.earthquake.rawValue, Cateory.debrisFlow.rawValue,Cateory.tsunami.rawValue,
                          Cateory.Typhoon.rawValue, Cateory.rainfall.rawValue,Cateory.flood.rawValue,
                          Cateory.highWater.rawValue, Cateory.coldSurge.rawValue,Cateory.denseFog.rawValue,
                          Cateory.strongWind.rawValue, Cateory.Thunderstorm.rawValue,Cateory.highwater.rawValue,
                          Cateory.airRaidAlert.rawValue, Cateory.communicable.rawValue,Cateory.railIncident.rawValue,
                          Cateory.roadClose.rawValue, Cateory.Parking.rawValue,Cateory.workSchlClos.rawValue,
                          Cateory.ReservoirDis.rawValue, Cateory.GatesInfo.rawValue
                        ]
    var vateory = Cateory.earthquake.rawValue
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

//extension UserDeaultCategoryNSynchronize : CustomStringConvertible {
//    var description: String {
//        var temp = String()
//        for (key,value) in dicCategoryRootKye {
//            temp += String(format: "key %s = %@ \n", key, String(value))
//        }
//        return temp
//    }
//}


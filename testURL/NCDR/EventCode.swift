//
//  EventCode.swift
//  testURL
//
//  Created by HsuKaiChieh on 22/03/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import Foundation


struct UserDeaultCategory: CustomStringConvertible {
    let userDefault = UserDefaults.standard
    var dicCategoryRootKye = [String : Bool]()

    init() {
//        for key in CategorRootKye {
//            dicCategoryRootKye.updateValue(false, forKey: key)
//            userDefault.register(defaults: [key: false])
//        }
        //default value
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .earthquake): true])
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .Typhoon): true])
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .workSchlClos): true])
//        dicCategoryRootKye.updateValue(true, forKey: Cateory.earthquake.rawValue)
//        dicCategoryRootKye.updateValue(true, forKey: Cateory.Typhoon.rawValue)
//        dicCategoryRootKye.updateValue(true, forKey: Cateory.workSchlClos.rawValue)
//        self.getDataFromUserDefault()
    }
//    mutating func getDataFromUserDefault() {
//        for (key,_) in dicCategoryRootKye {
//            let value  = UserDefaults.Cateory.bool(forKey: UserDefaults.Cateory.defaultKeys(rawValue: key)!)
//            dicCategoryRootKye.updateValue(value!, forKey: key)
//        }
//    }
    mutating func backDataToUserDefault() {
        for (key,value) in dicCategoryRootKye {
            UserDefaults.Cateory.set(value: value, for: UserDefaults.Cateory.defaultKeys(rawValue: key)!)
        }
        userDefault.synchronize()
    }
//    mutating func update(value: Bool, forKey: Cateory) {
//        userDefault.set(value, forKey: forKey.rawValue)
//    }
//    func getDate(fromkey: Cateory ) -> Bool? {
//        return userDefault.bool(forKey: fromkey.rawValue)
//    }
    var description: String {
        var temp = ""
        for (key,value) in dicCategoryRootKye {
//            temp += String(format: "key %s = %s \n", String(key), String(value.description))
            temp += "\(key) : \(value) \n"
        }
        return temp
    }
}
protocol UserDefaultsSettable {
    associatedtype defaultKeys: RawRepresentable
}
extension UserDefaultsSettable where defaultKeys.RawValue == String {
    static func set(value: Bool?, for key: defaultKeys) {
        let keyString = key.rawValue
        UserDefaults.standard.set(value, forKey: keyString)
    }
    static func bool(forKey key: defaultKeys) -> Bool {
        let keyString = key.rawValue
        return UserDefaults.standard.bool(forKey: keyString)
    }
    static func getkeystring(forKey key: defaultKeys) -> String {
        return key.rawValue
    }
}

extension UserDefaults {
    struct Cateory: UserDefaultsSettable {
        enum defaultKeys: String {
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
    }
}

//extension UserDeaultCategoryNSynchronize : CustomStringConvertible {
//    var description: String {
//        var temp = String()
//        for (key,value) in dicCategoryRootKye {
//            temp += String(format: "key %s = %s \n", String(key), String(value.description))
//        }
//        return temp
//    }
//}


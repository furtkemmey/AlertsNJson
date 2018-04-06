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
    var dicCategoryRootKey = [String : Bool]()

    init() {
        for key in CategorRootKye {
            dicCategoryRootKey.updateValue(true, forKey: key)
        }
        setDefaultRegister()
        self.getDataFromUserDefault()
    }
    mutating func getDataFromUserDefault() {
        for key in CategorRootKye {
            let value  = UserDefaults.Cateory.bool(forKey: UserDefaults.Cateory.defaultKeys(rawValue: key)!)
            dicCategoryRootKey.updateValue(value, forKey: key)
        }
    }
    mutating func backDataToUserDefault() {
        for (key,value) in dicCategoryRootKey {
            UserDefaults.Cateory.set(value: value, for: UserDefaults.Cateory.defaultKeys(rawValue: key)!)
        }
        userDefault.synchronize()
    }
    var description: String {
        var temp = "{\n"
        for (key,value) in dicCategoryRootKey {
            temp += "\(key) : \(value) \n"
        }
        temp += "}"
        return temp
    }
    private func setDefaultRegister() {
        // default value
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .earthquake): true])
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .debrisFlow): true])
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .tsunami): true])

        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .Typhoon): true])
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .rainfall): true])
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .flood): true])
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .highWater): true])
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .coldSurge): true])
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .denseFog): true])
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .strongWind): true])
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .Thunderstorm): true])
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .highwater): true])

        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .airRaidAlert): true])

        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .communicable): true])

        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .railIncident): true])
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .roadClose): true])
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .Parking): true])

        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .workSchlClos): true])
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .ReservoirDis): true])
        userDefault.register(defaults: [UserDefaults.Cateory.getkeystring(forKey: .GatesInfo): true])
    }
    private let CategorRootKye = [
                             UserDefaults.Cateory.getkeystring(forKey: .earthquake),
                             UserDefaults.Cateory.getkeystring(forKey: .debrisFlow),
                             UserDefaults.Cateory.getkeystring(forKey: .tsunami),

                             UserDefaults.Cateory.getkeystring(forKey: .Typhoon),
                             UserDefaults.Cateory.getkeystring(forKey: .rainfall ),
                             UserDefaults.Cateory.getkeystring(forKey: .flood ),
                             UserDefaults.Cateory.getkeystring(forKey: .highWater ),
                             UserDefaults.Cateory.getkeystring(forKey: .coldSurge ),
                             UserDefaults.Cateory.getkeystring(forKey: .denseFog ),
                             UserDefaults.Cateory.getkeystring(forKey: .strongWind ),
                             UserDefaults.Cateory.getkeystring(forKey: .Thunderstorm ),
                             UserDefaults.Cateory.getkeystring(forKey: .highwater ),

                             UserDefaults.Cateory.getkeystring(forKey: .airRaidAlert ),

                             UserDefaults.Cateory.getkeystring(forKey: .communicable ),

                             UserDefaults.Cateory.getkeystring(forKey: .railIncident ),
                             UserDefaults.Cateory.getkeystring(forKey: .roadClose ),
                             UserDefaults.Cateory.getkeystring(forKey: .Parking ),

                             UserDefaults.Cateory.getkeystring(forKey: .workSchlClos ),
                             UserDefaults.Cateory.getkeystring(forKey: .ReservoirDis ),
                             UserDefaults.Cateory.getkeystring(forKey: .GatesInfo ),
                         ]
}

protocol UserDefaultsSettable {
    associatedtype defaultKeys: RawRepresentable
}

// default func
extension UserDefaultsSettable where defaultKeys.RawValue == String {
    static func set(value: Bool?, for key: defaultKeys) {
        let keyString = key.rawValue
        UserDefaults.standard.set(value, forKey: keyString)
    }
    static func set(value: Bool?, for key: String) {
        let keyString = key
        UserDefaults.standard.set(value, forKey: keyString)
    }
    static func bool(forKey key: defaultKeys) -> Bool {
        let keyString = key.rawValue
        return UserDefaults.standard.bool(forKey: keyString)
    }
    static func bool(forKey key: String) -> Bool {
        let keyString = key
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

//
//  JSONData.swift
//  testURL
//
//  Created by HsuKaiChieh on 09/02/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//
import Foundation

protocol AlertJSONDelegate: class {
    func AlertJSON(_ alertJSON:AlertJson?,didLoad feeds: AlertFeeds?,and entry: [Entry]?)
}

class AlertJson: NSObject {
    private var urlJson: URL?
    var alertFeeds: AlertFeeds?
    weak var delegate: AlertJSONDelegate?
    
    init?(URLString: String) {
        super.init()
        urlJson = URL(string: URLString)
        alertFeeds = AlertFeeds()
        if !(self.getDataFromInternet(URLString: URLString)) {
            return nil
        }
    }
    
    func getDataFromInternet(URLString: String) -> Bool {
        if let url = URL(string: URLString) {
            DispatchQueue.global(qos: .userInitiated).async{ [weak self] in
                let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response , error) in
                                               // check url really we want
                    if let data = data, url == self?.urlJson {
                        guard let jsonDicObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any] else {
                             return
                        }
                        
                        // root
                        if let title = jsonDicObj!["title"] as? String {
                            self?.alertFeeds?.title = title
                        }
                        switch jsonDicObj!["entry"] {
                        case let entry as [String : Any]:
                                self?.analysisEntry(entry: entry)
                        case let entries as [[String : Any]]:
                            for entry in entries {
                                self?.analysisEntry(entry: entry)
                            }
                        default:
                            print("")
                        }
                    } else { // if let data = data, url == self?.urlJson
                        print("Error...")
                    }
                    self?.delegate?.AlertJSON(self, didLoad: self?.alertFeeds, and: self?.alertFeeds?.entries)
                } // end URLSession.shared.dataTask
                task.resume()
            }
        } else { // end if let url = URL
            return false
        }
        return true
    }
    private func analysisEntry(entry:  [String : Any] ) {
        var entryTemp = Entry()
         // id
        if let idString = entry["id"] as? String {
            entryTemp.idString = idString

        }
        // title
        if let title = entry["title"] as? String {
            entryTemp.title = title

        }
        // updated
        if let updated = entry["updated"] as? String {
            entryTemp.updated = updated
        }
        // author
        if let author = entry["author"] as? [String : String] {
            entryTemp.author = author["name"]
        }
        // Link
        if let author = entry["link"] as? [String : String] {
            entryTemp.linkHref = author["@href"]
        }
        // summary
        if let summary = entry["summary"] as? [String : String] {
            entryTemp.summary = summary["#text"]?.trimmingCharacters(in: .whitespaces)
        }
        // category
        if let category = entry["category"] as? [String : String] {
            entryTemp.category = category["@term"]
        }
        alertFeeds?.entries?.append(entryTemp)
    }
    /// get switch on items
    func alertFeedsEntriesFiltered() -> [Entry]? {
        var userDeaultCategory: UserDeaultCategory? = UserDeaultCategory()
        userDeaultCategory?.getDataFromUserDefault()
        let dicCategoryRootKeyFilter: [String : Bool]?  = userDeaultCategory?.dicCategoryRootKey.filter {
            $0.value == true
        }
        var tempEntry = [Entry]()
        guard self.alertFeeds?.entries != nil,dicCategoryRootKeyFilter != nil else {
            return nil
        }
        for ent in (self.alertFeeds?.entries!)! {
            for (value,key) in (dicCategoryRootKeyFilter)! {
                if ent.keyTitle == nil { continue }
                if ent.keyTitle == value, key == true {
                    tempEntry.append(ent)
                }
            }
        }
        return tempEntry
    }
}

struct AlertFeeds {
    init() {
        entries = [Entry]()
    }
    var idString: String?
    var title: String?
    var entries: [Entry]?
}
extension AlertFeeds : CustomStringConvertible {
    var description: String {
        return "idString = \(String(describing: self.idString))\n title = \(String(describing: self.title))\n entries = \(String(describing: self.entries))"
    }
}

struct Entry {
    var idString: String?
    var title: String?
    var keyTitle: String? {
        if title != nil {
            return keyTitleList[title!]
        }
        return nil
    }
    var updated: String?
    var author: String?
    var linkHref: String?
    var summary: String?
    var category: String?
    var city: String? {
        if self.summary != nil {
            return self.summary!.components(separatedBy: " ").first?.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return nil
    }
    var keyTitleList:[String : String] = [
        "地震" : UserDefaults.Cateory.getkeystring(forKey: .earthquake),
        "土石流" :UserDefaults.Cateory.getkeystring(forKey: .debrisFlow),
        "海嘯" : UserDefaults.Cateory.getkeystring(forKey: .tsunami),

        "颱風" : UserDefaults.Cateory.getkeystring(forKey: .Typhoon),
        "降雨" : UserDefaults.Cateory.getkeystring(forKey: .rainfall ),
        "淹水" : UserDefaults.Cateory.getkeystring(forKey: .flood ),
        "河川高水位" : UserDefaults.Cateory.getkeystring(forKey: .highWater ),
        "低溫" : UserDefaults.Cateory.getkeystring(forKey: .coldSurge ),
        "濃霧" : UserDefaults.Cateory.getkeystring(forKey: .denseFog ),
        "強風" : UserDefaults.Cateory.getkeystring(forKey: .strongWind ),
        "雷雨" : UserDefaults.Cateory.getkeystring(forKey: .Thunderstorm ),
        "水位警戒" : UserDefaults.Cateory.getkeystring(forKey: .highwater ),

        "防空" : UserDefaults.Cateory.getkeystring(forKey: .airRaidAlert ),

        "國際旅遊疫情" : UserDefaults.Cateory.getkeystring(forKey: .communicable ),

        "鐵路事故" : UserDefaults.Cateory.getkeystring(forKey: .railIncident ),
        "道路封閉" : UserDefaults.Cateory.getkeystring(forKey: .roadClose ),
        "開放臨時停車" : UserDefaults.Cateory.getkeystring(forKey: .Parking ),

        "停班停課" : UserDefaults.Cateory.getkeystring(forKey: .workSchlClos ),
        "水庫放流" : UserDefaults.Cateory.getkeystring(forKey: .ReservoirDis ),
        "水門資訊" : UserDefaults.Cateory.getkeystring(forKey: .GatesInfo )
    ]
}
extension Entry : CustomStringConvertible {
    var description: String {
        return "idString = \(String(describing: self.idString))\n title = \(String(describing: self.title))\n updated = \(String(describing: self.updated)),author = \(String(describing: self.author))\n,href = \(String(describing: self.linkHref))\n,summary = \(String(describing: self.summary))\n,category = \(String(describing: self.category))\n------------\n"
    }
}


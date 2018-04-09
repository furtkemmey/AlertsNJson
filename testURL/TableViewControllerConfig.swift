//
//  TableViewControllerConfig.swift
//  testURL
//
//  Created by HsuKaiChieh on 31/03/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import UIKit

class TableViewControllerConfig: UITableViewController {
    lazy var userDeaultCategory = UserDeaultCategory()

    private var titleList:[String] = [
        "地震",
        "土石流",
        "海嘯",
        
        "颱風",
        "降雨",
        "淹水",
        "河川高水位",
        "低溫",
        "濃霧",
        "強風",
        "雷雨",
        "水位警戒",
        
        "防空",
        
        "國際旅遊疫情",
        
        "鐵路事故",
        "道路封閉",
        "開放臨時停車",
        
        "停班停課",
        "水庫放流",
        "水門資訊",
    ]
    private var keyTitleList:[String : String] = [
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
    
    // MARK: IBAction
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if let cell = sender.superview?.superview as? TableViewCellConfig   {
            let indexPath = tableView.indexPath(for: cell)
            let value = cell.switchShow.isOn
            userDeaultCategory.dicCategoryRootKey[keyTitleList[titleList[(indexPath?.row)!]]!] = value
            userDeaultCategory.backDataToUserDefault();
        }
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 180
//        tableView.rowHeight = UITableViewAutomaticDimension
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDeaultCategory.dicCategoryRootKey.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "configCell", for: indexPath)
        if let titleCell = cell as? TableViewCellConfig {
            titleCell.lblShow.text = titleList[indexPath.row]
            titleCell.switchShow.setOn(UserDefaults.Cateory.bool(forKey: keyTitleList[titleList[indexPath.row]]!), animated: true)
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cellForRow = tableView.cellForRow(at: indexPath) as? TableViewCellConfig {
            print(cellForRow.lblShow.text!)
        }
    }
}

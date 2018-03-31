//
//  TableViewControllerConfig.swift
//  testURL
//
//  Created by HsuKaiChieh on 31/03/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import UIKit

class TableViewControllerConfig: UITableViewController {
    var userDeaultCategory = UserDeaultCategory()
    var TitleList:[String] = [
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

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 180
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDeaultCategory.dicCategoryRootKey.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "configCell", for: indexPath)
        if let titleCell = cell as? TableViewCellConfig {
//            print("\(userDeaultCategory.dicCategoryRootKey)")
            titleCell.lblShow.text = TitleList[indexPath.row]
            
//            titleCell.switchShow.setOn(dic[indexPath.row].value, animated: true)
            
        }
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

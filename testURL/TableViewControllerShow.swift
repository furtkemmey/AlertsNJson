//
//  TableViewControllerShow.swift
//  testURL
//
//  Created by KaiChieh on 27/03/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import UIKit

class TableViewControllerShow: UITableViewController {
    var alertJson: AlertJson?
    var entry: [Entry]?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none // no separator
        alertJson = AlertJson(URLString: "https://alerts.ncdr.nat.gov.tw/JSONAtomFeed.ashx")
        alertJson?.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.entry?.count) ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
        if let titleCell = cell as? TableViewCellShow {
            titleCell.lblTitle.text = entry?[indexPath.row].title
            titleCell.lblUpdated.text = entry?[indexPath.row].updated
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

extension TableViewControllerShow: AlertJSONDelegate {
    func AlertJSON(_ alertJSON: AlertJson?, didLoad feeds: AlertFeeds?, and entry: [Entry]?) {
        print("AlertJSONDelegate call")
        //        printLog("\(String(describing: feeds))")
        print("\(String(describing: entry?.first))")
        self.entry = entry
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

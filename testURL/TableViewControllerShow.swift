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
    var userDeaultCategory: UserDeaultCategory? = UserDeaultCategory()
    var currentRow = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none // no separator
        alertJson = AlertJson(URLString: "https://alerts.ncdr.nat.gov.tw/JSONAtomFeed.ashx")
        alertJson?.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        for (key,value) in (userDeaultCategory?.dicCategoryRootKye)! {
            print("key is \(key) \(value)")
        }

    }
    override func viewWillDisappear(_ animated: Bool) {
        userDeaultCategory?.backDataToUserDefault()
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentRow = indexPath.row
    }
    // MARK: - prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "showSummary":
                if  let seguedToMVC = segue.destination as? ViewController {
                    seguedToMVC.entry = alertJson?.alertFeeds?.entries?[currentRow]
                }
            default: break
            }
        }
    }
}

extension TableViewControllerShow: AlertJSONDelegate {
    func AlertJSON(_ alertJSON: AlertJson?, didLoad feeds: AlertFeeds?, and entry: [Entry]?) {
//        print("AlertJSONDelegate call")
        //        printLog("\(String(describing: feeds))")
//        print("\(String(describing: entry?.first))")
        self.entry = entry
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

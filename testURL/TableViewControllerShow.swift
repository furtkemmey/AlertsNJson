//
//  TableViewControllerShow.swift
//  testURL
//
//  Created by KaiChieh on 27/03/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import UIKit

class TableViewControllerShow: UITableViewController {
    var URLStringAddress = "https://alerts.ncdr.nat.gov.tw/JSONAtomFeed.ashx"
    var alertJson: AlertJson?
    var entry: [Entry]? = [Entry]()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
       // tableView.separatorStyle = .none // no separator
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        alertJson = AlertJson(URLString: URLStringAddress)
        alertJson?.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.entry = []
        self.entry = alertJson?.alertFeedsEntriesFiltered()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
            titleCell.imageViewIcon.image = UIImage(named: (entry?[indexPath.row].keyTitle!)!)
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
                switch identifier {
                case "showSummary":
                    if  let seguedToMVC = segue.destination as? ViewController {
                        if let cell = sender as? TableViewCellShow,
                            let indexPath = tableView.indexPath(for: cell) {
                            seguedToMVC.entry = alertJson?.alertFeeds?.entries?[indexPath.row]
                           // print("currentRow from prepare is \(indexPath.row)")
                        }
                    }
                default: break
                } // end switch
        } // end if
    }
}

// MARK: - JSON Deleate
extension TableViewControllerShow: AlertJSONDelegate {
    func AlertJSON(_ alertJSON: AlertJson?, didLoad feeds: AlertFeeds?, and entry: [Entry]?) {
        self.entry = []
        self.entry = alertJSON?.alertFeedsEntriesFiltered()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

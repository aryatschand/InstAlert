//
//  TypesOfDisastersTableView.swift
//  HackForResilienceApp
//
//  Created by Arya Tschand on 9/8/18.
//  Copyright © 2018 Manan Saaraswat. All rights reserved.
//

import UIKit

class TypesOfDisastersTableView: UITableViewController {

    let titleArray: [String] = ["Tornado", "Hurricane", "Earthquake", "Tsunami", "Storm", "Blizzard"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DisasterCell", for: indexPath)
        
        cell.textLabel?.text = titleArray[indexPath.row]
        
        return cell
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DisasterSelection" {
            var DisasterTimeTableView = segue.destination as! DisasterTimeTableView
            var selectedIndexPath = tableView.indexPathForSelectedRow
            DisasterTimeTableView.selectedDisaster = titleArray[selectedIndexPath!.row]
        }
        
    }
}

//
//  DisasterTimeTableView.swift
//  HackForResilienceApp
//
//  Created by Arya Tschand on 9/8/18.
//  Copyright © 2018 Manan Saaraswat. All rights reserved.
//

import UIKit

class DisasterTimeTableView: UITableViewController {

    var selectedDisaster: String = ""
    let titleArray: [String] = ["Before", "During", "After"]
    @IBOutlet weak var NavigationTitle: UINavigationItem!
    
    override func viewDidLoad() {
        NavigationTitle.title = selectedDisaster
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeCell", for: indexPath)
        
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
        
        if segue.identifier == "ShowInfo" {
            var InformationScrollView = segue.destination as! InformationScrollViewController
            var selectedIndexPath = tableView.indexPathForSelectedRow
            InformationScrollView.naturalDisaster = selectedDisaster
            InformationScrollView.timeDescription = titleArray[selectedIndexPath!.row]
            InformationScrollView.requestInfo = true
        }
        
    }
    
}

//
//  SelectContactTableView.swift
//  HackForResilienceApp
//
//  Created by Arya Tschand on 9/8/18.
//  Copyright © 2018 Manan Saaraswat. All rights reserved.
//

import UIKit

class SelectContactTableView: UITableViewController {

    var contactArray = [Contact]()
    var contact: Contact!
    var enteredDisaster: String = ""
    var safeString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let person = contactArray[indexPath.row]
        
        cell.textLabel?.text = "\(person.name) #\(person.displayPhoneNumber)"
        
        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectContact" {
            var EmergencyInput = segue.destination as! EmergencyInput
            var selectedIndexPath = tableView.indexPathForSelectedRow
            EmergencyInput.emergencyNumber = contactArray[selectedIndexPath!.row].phoneNumber
            EmergencyInput.selectionReturned = true
            EmergencyInput.enteredNaturalDisaster = enteredDisaster
            EmergencyInput.SafeString = safeString

        }
    }
}

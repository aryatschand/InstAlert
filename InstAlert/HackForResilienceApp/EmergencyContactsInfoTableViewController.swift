//
//  EmergencyContactsInfoTableViewController.swift
//  HackForResilienceApp
//
//  Created by Arya Tschand on 9/7/18.
//  Copyright © 2018 Manan Saaraswat. All rights reserved.
//

import UIKit

class EmergencyContactsInfoTableViewController: UITableViewController {
    
    var contactArray = [Contact]()
    var contact: Contact!
    var currentNewPerson: Int = 0

    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Contacts.plist")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadContacts()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let person = contactArray[indexPath.row]

        if person.phoneNumber == "remove" {
            let alert = UIAlertController(title: "Contact Imcomplete", message: "Recently Added/Edited Contact Deleted due to Incomplete Information", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            })
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
            contactArray.remove(at: indexPath.row)
            currentNewPerson = currentNewPerson - 1
            SaveContacts()
            
        } else {
            cell.textLabel?.text = "\(person.name) #\(person.displayPhoneNumber)"

        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let alert = UIAlertController(title: "Delete Contact", message: "Are You Sure You Want to Delete Contact?", preferredStyle: .alert)
            let delete = UIAlertAction(title: "Delete", style: .default, handler: { (action) in
                self.contactArray.remove(at: indexPath.item)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                self.currentNewPerson = self.currentNewPerson - 1
                self.SaveContacts()
            })
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            })
            alert.addAction(delete)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currentNewPerson = tableView.numberOfRows(inSection: 0)
        SaveContacts()
        self.tableView.reloadData()
        
    }
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Contact", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        let action = UIAlertAction(title: "Add Contact", style: .default) { (action) in
            
            let newContact = Contact()
            self.contactArray.append(newContact)
            self.SaveContacts()
            print("new")

            self.performSegue(withIdentifier: "NewContact", sender: self)
        }
        
        
        alert.addAction(action)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }

    
    
    func SaveContacts() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(contactArray)
            try data.write(to: dataFilePath!)
            
        } catch {
            print("Error encoding team array, \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadContacts() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                contactArray = try decoder.decode([Contact].self, from: data)
            } catch {
                print("Error decoding team array, \(error)")
            }
        }
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContactSelect" {
            var ContactInfoViewController = segue.destination as! ContactInfoViewController
            var selectedIndexPath = tableView.indexPathForSelectedRow
            ContactInfoViewController.contact = contactArray[selectedIndexPath!.row]
            ContactInfoViewController.contactIndex = selectedIndexPath!.row
            ContactInfoViewController.contactArray = contactArray
            SaveContacts()
            
        }
        if segue.identifier == "NewContact" {
            var ContactInfoViewController = segue.destination as! ContactInfoViewController
            ContactInfoViewController.contact = contactArray[currentNewPerson]
            ContactInfoViewController.contactIndex = currentNewPerson
            ContactInfoViewController.contactArray = contactArray
            SaveContacts()
        
        }
    }

}

//
//  ContactInfoViewController.swift
//  HackForResilienceApp
//
//  Created by Arya Tschand on 9/8/18.
//  Copyright © 2018 Manan Saaraswat. All rights reserved.
//

import UIKit

class ContactInfoViewController: UIViewController, UITextFieldDelegate {

    var contactArray = [Contact]()
    var contact: Contact!
    var contactIndex: Int = 0
    var integerPhoneNumber: String = ""
    var stringPhoneNumber: String = ""
    var name: String = ""
    var tenDigitsReached: Bool = false
    var previousCharacterCount: Int = 0
    var testString: String = ""
    var email: String = ""
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Contacts.plist")
    var willDisappear: Bool = false

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SaveContacts()
        if contactArray[contactIndex].name != "" {
            NameInput.text = contactArray[contactIndex].name
            NameLabel.text = "Name (Compelete)"
            NameLabel.textColor = UIColor.green
            NavigationTitle.title = contactArray[contactIndex].name
        }
        if contactArray[contactIndex].displayPhoneNumber != "" {
            NumberInput.text = contactArray[contactIndex].displayPhoneNumber
            NumberLabel.text = "Phone Number (Compelete)"
            NumberLabel.textColor = UIColor.green
        }
        if contactArray[contactIndex].email != "" {
            EmailInput.text = contactArray[contactIndex].email
            EmailLabel.text = "Email Address (Compelete)"
            EmailLabel.textColor = UIColor.green
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NameLabel.textColor = UIColor.red
        NumberLabel.textColor = UIColor.red
        EmailLabel.textColor = UIColor.red
        self.EmailInput.delegate = self
        self.NameInput.delegate = self
        self.NumberInput.delegate = self

    }
    
    @IBOutlet weak var EmailLabel: UILabel!
    
    @IBOutlet weak var EmailInput: UITextField!
    
    @IBOutlet weak var NameInput: UITextField!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var NumberInput: UITextField!
    
    @IBOutlet weak var NumberLabel: UILabel!
    
    @IBAction func EmailChanged(_ sender: UITextField) {
        email = EmailInput.text!
        contactArray[contactIndex].email = email
        if EmailInput.text != "" {
            EmailLabel.text = "Email Address (Compelete)"
            EmailLabel.textColor = UIColor.green
        }else {
            EmailLabel.text = "Email Address (Incomplete)"
            EmailLabel.textColor = UIColor.red
        }
    }
    
    @IBAction func NameChanged(_ sender: Any) {

        name = NameInput.text!
        contactArray[contactIndex].name = name
        if NameInput.text != "" {
            NameLabel.text = "Name (Compelete)"
            NameLabel.textColor = UIColor.green
        }else {
            NameLabel.text = "Name (Incomplete)"
            NameLabel.textColor = UIColor.red
        }
        print(contactIndex)
        print(contactArray[contactIndex].name)
        SaveContacts()
    }
    
    @IBAction func NumberChanged(_ sender: UITextField) {
    
        if NumberInput.text!.range(of:"-") == nil && (NumberInput.text?.count)! > 4 {
            print("yes")
            integerPhoneNumber = NumberInput.text!
            var stringPhoneNumber = integerPhoneNumber
            stringPhoneNumber.insert("-", at: stringPhoneNumber.index(stringPhoneNumber.startIndex, offsetBy: 3))
            stringPhoneNumber.insert("-", at: stringPhoneNumber.index(stringPhoneNumber.startIndex, offsetBy: 7))
            NumberInput.text = stringPhoneNumber

        }
    
    if tenDigitsReached == false {
//        if (NumberInput.text?.count)! > 1 {
//            if String(NumberInput.text!.last!) != "-" {
//                numberArray.append(Int(String(NumberInput.text!.last!))!)
//            }
//        }
        
            stringPhoneNumber = NumberInput.text!
            if (stringPhoneNumber.count == 3 || stringPhoneNumber.count == 7) && (NumberInput.text?.count)! > previousCharacterCount{
                stringPhoneNumber = "\(stringPhoneNumber)-"
                NumberInput.text = stringPhoneNumber
            }
            
        } else if tenDigitsReached == true{
        }
        if (NumberInput.text?.count)! >= 12 {
            tenDigitsReached = true
            NumberInput.text = stringPhoneNumber
            NumberLabel.text = "Phone Number (Compelete)"
            NumberLabel.textColor = UIColor.green
        } else {
            tenDigitsReached = false
            NumberLabel.text = "Phone Number (Incomplete)"
            NumberLabel.textColor = UIColor.red
        }
        previousCharacterCount = (NumberInput.text?.count)!
        testString = stringPhoneNumber
        if let range = testString.range(of: "-") {
            testString.removeSubrange(range)
            integerPhoneNumber = testString
        }
        if let range = testString.range(of: "-") {
            testString.removeSubrange(range)
            integerPhoneNumber = testString
        }
        contactArray[contactIndex].phoneNumber = integerPhoneNumber
        contactArray[contactIndex].displayPhoneNumber = stringPhoneNumber
    SaveContacts()
    }
    override func viewWillDisappear(_ animated: Bool) {
        if contactArray[contactIndex].name == "" || contactArray[contactIndex].phoneNumber == "" || contactArray[contactIndex].email == ""{
            contactArray[contactIndex].phoneNumber = "remove"
            print("removed")
        }
        SaveContacts()
        willDisappear = true
    }
    @IBAction func SendButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)

    }
    
    @IBOutlet weak var NavigationTitle: UINavigationItem!
    
    func SaveContacts() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(contactArray)
            try data.write(to: dataFilePath!)
            
        } catch {
            print("Error encoding team array, \(error)")
        }
        
    }
    
}

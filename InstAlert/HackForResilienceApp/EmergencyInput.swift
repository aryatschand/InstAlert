//
//  EmergencyInput.swift
//  HackForResilienceApp
//
//  Created by Arya Tschand on 9/7/18.
//  Copyright © 2018 Manan Saaraswat. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import MessageUI
import Foundation

import UIKit

class EmergencyInput: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate, CLLocationManagerDelegate {
    
    var contactArray = [Contact]()
    var contact: Contact!
    var currentNewPerson: Int = 0
    var emailArray: [String] = []
    var emergencyNumber: String = ""
    var selectionReturned: Bool = false
    var locationManager: CLLocationManager = CLLocationManager()
    var latitude: Double = 0
    var longitude: Double = 0
   var EmergencyString: String = ""
   var SafeString: String = ""
   var addressString : String = ""
   var locationLoaded: Bool = false
   var enteredNaturalDisaster: String = "Tornado"


    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Contacts.plist")
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return NaturalDisasterArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return NaturalDisasterArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        enteredNaturalDisaster = NaturalDisasterArray[row]
        checkRequirements()
      self.SetEmergencyString()
      self.SetSafeString()
    }
    
   
    var NaturalDisasterArray: [String] = ["Tornado", "Hurricane", "Earthquake", "Tsunami", "Storm", "Blizzard"]
    
    var urgency: Int = 0
    var isEmergency: Bool = false
    var ButtonIsPressed: Bool = false
    var safeButtonPressed: Bool = false

    @IBOutlet weak var DisasterPickerView: UIPickerView!
    
    @IBOutlet weak var UrgencySlider: UISlider!
    @IBOutlet weak var SendButton: UIButton!
    
    @IBOutlet weak var SMSButton: UIButton!
    @IBOutlet weak var UrgencyLabel: UILabel!
    
    @IBAction func SliderChanged(_ sender: UISlider) {
        UrgencyLabel.text = "Urgency: \(Int(UrgencySlider.value))"
        urgency = Int(UrgencySlider.value)
        checkRequirements()
      self.SetEmergencyString()
      self.SetSafeString()
    }
    @IBOutlet weak var EmergencyButton: UIButton!
    @IBOutlet weak var SafeButton: UIButton!
    
    @IBAction func EmergencyButtonClicked(_ sender: UIButton) {
      
      
      UrgencySlider.setValue(10, animated: false)
      urgency = 10
      UrgencyLabel.text = "Urgency: 10"
        SafeButton.backgroundColor = UIColor.gray
        EmergencyButton.backgroundColor = UIColor.red
        UrgencySlider.isHidden = false
        UrgencySlider.isEnabled = true
        UrgencyLabel.isHidden = false
        UrgencyLabel.isEnabled = true
        DisasterPickerView.isHidden = false
        ButtonIsPressed = true
        DisasterPickerView.isUserInteractionEnabled = true
        SendButton.isHidden = true
        SendButton.isEnabled = false
        
        isEmergency = true
        safeButtonPressed = false

        checkRequirements()

    }
    
    @IBAction func SendButtonClicked(_ sender: UIButton) {
        if SendButton.isEnabled == false {
            SendButton.isHidden = false
            SendButton.isEnabled = true
        } else {
            if isEmergency == false {
                emailArray = []
                for var x in 0...contactArray.count-1{
                    emailArray.append(contactArray[x].email)
                }
               UrgencySlider.isEnabled = false
               UrgencySlider.isHidden = true
               urgency = 0
               UrgencyLabel.text = "Urgency: 0"
               UrgencyLabel.isHidden = true
                let composeVC = MFMailComposeViewController()
                composeVC.mailComposeDelegate = self
                
                // Configure the fields of the interface.
                composeVC.setBccRecipients(emailArray)
                composeVC.setSubject("I AM SAFE")
                composeVC.setMessageBody(SafeString, isHTML: false)
    
                // Present the view controller modally.
                self.present(composeVC, animated: true, completion: nil)
               self.performSegue(withIdentifier: "EmailSmsSent", sender: self)
            }
        }
        
        
    }
    
    @IBAction func SMSButtonClicked(_ sender: UIButton) {
        if SMSButton.isEnabled == false {
            
        } else {
            if isEmergency == true {
                
                let messageVC = MFMessageComposeViewController()
                messageVC.body = EmergencyString
                messageVC.recipients = ["910"] // Optionally add some tel numbers
                messageVC.messageComposeDelegate = self
                
                present(messageVC, animated: true, completion: nil)
               self.performSegue(withIdentifier: "EmailSmsSent", sender: self)

                
            } else if isEmergency == false && selectionReturned == false{
                self.performSegue(withIdentifier: "SMSSafe", sender: self)
//            } else if isEmergency == false && selectionReturned == true {
//
//                let messageVC = MFMessageComposeViewController()
//                messageVC.body = "Message String"
//                messageVC.recipients = [emergencyNumber] // Optionally add some tel numbers
//                messageVC.messageComposeDelegate = self
//
//                present(messageVC, animated: true, completion: nil)
//                selectionReturned = false
//            }
        }
        }
        
    }
    
    @IBAction func SafeButtonClicked(_ sender: Any) {
      EmergencyButton.backgroundColor = UIColor.gray
        SafeButton.backgroundColor = UIColor.green
        UrgencySlider.isHidden = true
        UrgencySlider.isEnabled = false
        UrgencyLabel.isHidden = true
        UrgencyLabel.isEnabled = false
        DisasterPickerView.isHidden = false
        safeButtonPressed = true

        DisasterPickerView.isUserInteractionEnabled = true
        isEmergency = false
        ButtonIsPressed = true
        checkRequirements()

    }
    
    override func viewWillAppear(_ animated: Bool) {
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.delegate = self
      locationManager.requestWhenInUseAuthorization()
      locationManager.startUpdatingLocation()
        if selectionReturned == false{
            UrgencySlider.setValue(Float(urgency), animated: false)
            SafeButton.backgroundColor = UIColor.green
            EmergencyButton.backgroundColor = UIColor.red
            UrgencySlider.isHidden = true
            UrgencySlider.isEnabled = false
            UrgencyLabel.isHidden = true
            UrgencyLabel.isEnabled = false
            DisasterPickerView.isHidden = true
            DisasterPickerView.isUserInteractionEnabled = false
            isEmergency = false
            ButtonIsPressed = false
            checkRequirements()
            safeButtonPressed = false
            SendButton.isHidden = true
            SendButton.isEnabled = false
            SMSButton.isHidden = true
            SMSButton.isEnabled = false
            urgency = 0
            UrgencyLabel.text = "Urgency: 0"
            self.UrgencySlider.setValue(0, animated: false)
            enteredNaturalDisaster = "Tornado"
            self.DisasterPickerView.selectRow(0, inComponent: 0, animated: false)
        } else if selectionReturned == true{
            
         let messageVC = MFMessageComposeViewController()
         messageVC.body = SafeString
         messageVC.recipients = [emergencyNumber] // Optionally add some tel numbers
         messageVC.messageComposeDelegate = self
         
         present(messageVC, animated: true, completion: nil)
            selectionReturned = false
    }
    }
    
    @IBAction func ClearButtonPressed(_ sender: UIBarButtonItem) {
        UrgencySlider.setValue(0, animated: false)
        urgency = 0
        UrgencyLabel.text = "Urgency: 0"
        SafeButton.backgroundColor = UIColor.green
        EmergencyButton.backgroundColor = UIColor.red
        UrgencySlider.isHidden = true
        UrgencySlider.isEnabled = false
        UrgencyLabel.isHidden = true
        UrgencyLabel.isEnabled = false
        DisasterPickerView.isHidden = true
        DisasterPickerView.isUserInteractionEnabled = false
        isEmergency = false
        ButtonIsPressed = false
        checkRequirements()
        safeButtonPressed = false

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SafeButton.backgroundColor = UIColor.green
        EmergencyButton.backgroundColor = UIColor.red
        UrgencySlider.isHidden = true
        UrgencySlider.isEnabled = false
        UrgencyLabel.isHidden = true
        UrgencyLabel.isEnabled = false
        DisasterPickerView.isHidden = true
        DisasterPickerView.isUserInteractionEnabled = false
        isEmergency = false
        checkRequirements()
        safeButtonPressed = false
        SendButton.isHidden = true
        SendButton.isEnabled = false
        SMSButton.isHidden = true
        SMSButton.isEnabled = false
        loadContacts()

    }
    
    func checkRequirements() {
        if (urgency != 0 || safeButtonPressed == true) && ButtonIsPressed == true && enteredNaturalDisaster != "" {
            if isEmergency == true {
                SMSButton.isHidden = false
                SMSButton.isEnabled = true
                SendButton.isHidden = true
                SendButton.isEnabled = false
            } else if isEmergency == false {
                SendButton.isHidden = false
                SendButton.isEnabled = true
                SMSButton.isHidden = false
                SMSButton.isEnabled = true
            }
            
            
        } else {
            SendButton.isHidden = true
            SendButton.isEnabled = false
            SMSButton.isHidden = true
            SMSButton.isEnabled = false
        }
    }

    func SaveContacts() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(contactArray)
            try data.write(to: dataFilePath!)
            
        } catch {
            print("Error encoding team array, \(error)")
        }
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
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
        if segue.identifier == "SMSSafe" {
            var SelectContactTableView = segue.destination as! SelectContactTableView
            SelectContactTableView.contact = contact
            SelectContactTableView.contactArray = contactArray
            SelectContactTableView.enteredDisaster = enteredNaturalDisaster
         SelectContactTableView.safeString = SafeString
            SaveContacts()
        }
      
      if segue.identifier == "EmailSmsSent" {
         var InformationScrollViewController = segue.destination as! InformationScrollViewController
         InformationScrollViewController.naturalDisaster = enteredNaturalDisaster
         InformationScrollViewController.disasterOccurring = true
      }
      
    }
    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String) {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = Double("\(pdblLatitude)")!
        //21.228124
        let lon: Double = Double("\(pdblLongitude)")!
        //72.833770
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon
        
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        
        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
               if self.locationLoaded == false {

                let pm = placemarks! as [CLPlacemark]
                
                if pm.count > 0 {
                    let pm = placemarks![0]

                     if pm.name != nil {
                        self.addressString = self.addressString + pm.name! + ", "
                     }
                     if pm.locality != nil {
                        self.addressString = self.addressString + pm.locality! + ", "
                     }
                     if pm.country != nil {
                        self.addressString = self.addressString + pm.administrativeArea! + ", "
                     }
                     if pm.postalCode != nil {
                        self.addressString = self.addressString + pm.postalCode!
                     }
                     self.SetEmergencyString()
                     self.SetSafeString()
                     self.locationLoaded = true
                  
                    
                }
               }
        })
   
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result.rawValue {
            
        default:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation: CLLocation = locations[locations.count - 1]
        latitude = lastLocation.coordinate.latitude
        longitude = lastLocation.coordinate.longitude
        getAddressFromLatLon(pdblLatitude: String(latitude), withLongitude: String(longitude))
      self.SetEmergencyString()
      self.SetSafeString()
    }
   func SetEmergencyString()
   {
      EmergencyString = "This is an automated message that I am in an EMERGENCY due to a(n) \(enteredNaturalDisaster). I am currently located in \(addressString) (lat: \(latitude) long: \(longitude))."
      if urgency>0 {
          EmergencyString = EmergencyString + " This is \(urgency)/10 urgency."
      }
   }
   func SetSafeString()
   {
      SafeString = "This is an automated message that I am SAFE in a(n) \(enteredNaturalDisaster). I am currently located in \(addressString)."
   }
}

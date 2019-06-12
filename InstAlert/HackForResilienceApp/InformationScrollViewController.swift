//
//  InformationScrollViewController.swift
//  HackForResilienceApp
//
//  Created by Arya Tschand on 9/8/18.
//  Copyright © 2018 Manan Saaraswat. All rights reserved.
//

import UIKit

class InformationScrollViewController: UIViewController {
    
    @IBOutlet weak var InfoTitle: UILabel!
    @IBOutlet weak var InfoDescription: UITextView!
    
    var naturalDisaster: String = ""
    var disasterOccurring: Bool = false
    var requestInfo: Bool = false
    var stringToParse: String = ""
    var timeDescription: String = ""
    
    
    @IBOutlet weak var NavigationTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if disasterOccurring == true {
            if naturalDisaster == "Tornado" {
                var InfoArray = [Tornado]()
                let newInfo = Tornado()
                InfoArray.append(newInfo)
                stringToParse = InfoArray[0].during
                timeDescription = "During"
                InformationImage.image = #imageLiteral(resourceName: "icons8-tornado-filled-100.png")

            }
            if naturalDisaster == "Hurricane" {
                var InfoArray = [Hurricane]()
                let newInfo = Hurricane()
                InfoArray.append(newInfo)
                stringToParse = InfoArray[0].during
                timeDescription = "During"
                InformationImage.image = #imageLiteral(resourceName: "icons8-tornado-100.png")

            }
            if naturalDisaster == "Blizzard" {
                var InfoArray = [Blizzard]()
                let newInfo = Blizzard()
                InfoArray.append(newInfo)
                stringToParse = InfoArray[0].during
                timeDescription = "During"
                InformationImage.image = #imageLiteral(resourceName: "icons8-snow-100.png")

            }
            if naturalDisaster == "Storm" {
                var InfoArray = [Storm]()
                let newInfo = Storm()
                InfoArray.append(newInfo)
                stringToParse = InfoArray[0].during
                timeDescription = "During"
                InformationImage.image = #imageLiteral(resourceName: "icons8-heavy-rain-96.png")

            }
            if naturalDisaster == "Tsunami" {
                var InfoArray = [Tsunami]()
                let newInfo = Tsunami()
                InfoArray.append(newInfo)
                stringToParse = InfoArray[0].during
                timeDescription = "During"
                InformationImage.image = #imageLiteral(resourceName: "icons8-water-element-100.png")


            }
            if naturalDisaster == "Earthquake" {
                var InfoArray = [Earthquake]()
                let newInfo = Earthquake()
                InfoArray.append(newInfo)
                stringToParse = InfoArray[0].during
                timeDescription = "During"
                InformationImage.image = #imageLiteral(resourceName: "icons8-earthquakes-100.png")

            }
            disasterOccurring = false
        }
        if requestInfo == true {
            if naturalDisaster == "Tornado" {
                var InfoArray = [Tornado]()
                let newInfo = Tornado()
                InfoArray.append(newInfo)
                if timeDescription == "During" {
                    stringToParse = InfoArray[0].during
                } else if timeDescription == "Before" {
                    stringToParse = InfoArray[0].before
                } else if timeDescription == "After" {
                    stringToParse = InfoArray[0].after
                }
                InformationImage.image = #imageLiteral(resourceName: "icons8-tornado-filled-100.png")


            }
            if naturalDisaster == "Hurricane" {
                var InfoArray = [Hurricane]()
                let newInfo = Hurricane()
                InfoArray.append(newInfo)
                if timeDescription == "During" {
                    stringToParse = InfoArray[0].during
                } else if timeDescription == "Before" {
                    stringToParse = InfoArray[0].before
                } else if timeDescription == "After" {
                    stringToParse = InfoArray[0].after
                }
                InformationImage.image = #imageLiteral(resourceName: "icons8-tornado-100.png")
                
            }
            if naturalDisaster == "Blizzard" {
                var InfoArray = [Blizzard]()
                let newInfo = Blizzard()
                InfoArray.append(newInfo)
                if timeDescription == "During" {
                    stringToParse = InfoArray[0].during
                } else if timeDescription == "Before" {
                    stringToParse = InfoArray[0].before
                } else if timeDescription == "After" {
                    stringToParse = InfoArray[0].after
                }
                InformationImage.image = #imageLiteral(resourceName: "icons8-snow-100.png")

            }
            if naturalDisaster == "Storm" {
                var InfoArray = [Storm]()
                let newInfo = Storm()
                InfoArray.append(newInfo)
                if timeDescription == "During" {
                    stringToParse = InfoArray[0].during
                } else if timeDescription == "Before" {
                    stringToParse = InfoArray[0].before
                } else if timeDescription == "After" {
                    stringToParse = InfoArray[0].after
                }
                InformationImage.image = #imageLiteral(resourceName: "icons8-heavy-rain-96.png")

            }
            if naturalDisaster == "Tsunami" {
                var InfoArray = [Tsunami]()
                let newInfo = Tsunami()
                InfoArray.append(newInfo)
                if timeDescription == "During" {
                    stringToParse = InfoArray[0].during
                } else if timeDescription == "Before" {
                    stringToParse = InfoArray[0].before
                } else if timeDescription == "After" {
                    stringToParse = InfoArray[0].after
                }
                InformationImage.image = #imageLiteral(resourceName: "icons8-water-element-100.png")

            }
            if naturalDisaster == "Earthquake" {
                var InfoArray = [Earthquake]()
                let newInfo = Earthquake()
                InfoArray.append(newInfo)
                if timeDescription == "During" {
                    stringToParse = InfoArray[0].during
                } else if timeDescription == "Before" {
                    stringToParse = InfoArray[0].before
                } else if timeDescription == "After" {
                    stringToParse = InfoArray[0].after
                }
                InformationImage.image = #imageLiteral(resourceName: "icons8-earthquakes-100.png")

            }
            
            requestInfo = false
        }
        InfoTitle.text = "\(timeDescription) a(n) \(naturalDisaster)"
        let fullDescriptionArray = stringToParse.components(separatedBy: "/")
        InfoDescription.text = "1. \(fullDescriptionArray[0])" + "\n" + "\n" + "2. \(fullDescriptionArray[1])" + "\n" + "\n" + "3. \(fullDescriptionArray[2])" + "\n" + "\n" + "4. \(fullDescriptionArray[3])"
        NavigationTitle.title = "\(naturalDisaster)"
        
    }
    
    @IBOutlet weak var InformationImage: UIImageView!
    
}

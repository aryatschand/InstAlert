//
//  Information.swift
//  HackForResilienceApp
//
//  Created by Arya Tschand on 9/8/18.
//  Copyright © 2018 Manan Saaraswat. All rights reserved.
//

import Foundation

    class Tornado: Codable {
        let before: String = "Create a plan for where you and your family will go in the event of a tornado — at home, at work and at relatives’ or friends’ homes that you visit frequently.Pick a safe room in your home where household members and pets may gather during a tornado./This should be a basement, storm cellar or an interior room on the lowest floor with no windows./Listen to NOAA Weather Radio or to commercial radio or television newscasts for the latest information./Check with your work and your children’s school and day care center regarding tornado emergency plans."
        let during: String = "If you are in a house go to the basement or take shelter in a small interior ground floor room such as a bathroom, closet or hallway./If you have no basement, protect yourself by taking shelter under a heavy table or desk./If you are in an office or apartment building take shelter in an inner hallway or room, ideally in the basement or on the ground floor.Stay away from windows and the elevator in buildings./If you are driving if you spot a tornado in the distance go to the nearest solid shelter.In all cases get as close to the ground as possible, protect your head and watch for flying debris."
        
        let after: String = "Give first aid when appropriate. Don't try to move the seriously injured unless they are in immediate danger of further injury./Call for help. Turn on radio or television to get the latest emergency information./Stay out of damaged buildings. Return home only when authorities say it is safe./Use the telephone only for emergency calls and clean up spilled medicines, bleaches, or gasoline or other flammable liquids immediately.Leave the buildings if you smell gas or chemical fumes."
    }
    class Hurricane: Codable {
        let before: String = "Know all evacuation routes if you live close to the coast./Make sure your home meets building codes for withstanding hurricanes, and they have storm shutters./Have proper tools, supplies, and a first aid kit. Have plenty of batteries and flashlights./Always have plenty of non-perishable foods on hand."
        
        let during: String = "Use a portable radio to listen to important storm updates, information and instructions.Stay inside and keep away from all windows, skylights and glass doors. Go to a safe area, such as an interior room, closet or downstairs bathroom./Never go outside the protection of your home or shelter before there is confirmation that the storm has passed the area./If power is lost, keep the refrigerator closed to keep cold air trapped and delay spoilage of perishable food./If you use a portable generator, follow all the manufacturer’s instructions. Generators should be properly grounded to prevent electrical shock and should never be operated indoors."
        
        let after: String = "If you were evacuated, return home only after authorities advise it is safe to do so./If a gas leak is suspected, stay out of the property until the utility company deems it safe./Be cautious of hazards that are a product of the storm, such as water due to flooding, sharp or broken objects, damaged tree limbs or other structures that may have been damaged by high winds or water./ If known, include photographs, videotapes or personal property inventories you may already have available."
    }
    class Tsunami: Codable {
        let before: String = "Know how high above sea level your street is and how far it is from the coast. Evacuation orders may be based on those figures./Cobble together an emergency supplies kit./Plan your escape and evacuation routes. From the Red Cross: “If possible, pick areas 100 feet (30 meters) above sea level or go as far as 2 miles (3 kilometers) inland, away from the coastline. If you cannot get this high or far, go as high or far as you can. Every foot inland or upward may make a difference. You should be able to reach your safe location on foot within 15 minutes.”/Practice evacuating."
        let during: String = "If there’s an earthquake while you are on the coast and indoors, drop, cover and hold on. If you’re outside, stay away from falling objects./When the shaking is over, move quickly to inland, higher ground. Go on foot if you can. Stay there until officials say it’s all clear./Bring your animals if you evacuate. Bring your preparedness kit./Listen to official sources such as a National Oceanic and Atmospheric Administration weather radio or the U.S. Coast Guard emergency frequency station if a tsunami watch has been issued."
        let after: String = "Tell family and friends you’re OK and keep tuned in to official information sources or local media./Don’t assume the danger is over after the first wave. The next one might be bigger./Help people such as the elderly, infants and people with disabilities and call authorities if someone needs to be rescued./Stay away from disaster zones and out of buildings that have water around them."
    }
    class Earthquake: Codable {
        let before: String = "Make sure you have a fire extinguisher, first aid kit, a battery-powered radio, a flashlight, and extra batteries at home./Learn how to turn off the gas, water, and electricity and make up a plan of where to meet your family after an earthquake./Don't leave heavy objects on shelves (they'll fall during a quake)./Anchor heavy furniture, cupboards, and appliances to the walls or floor."
        let during: String = "If you're indoors, stay indoors and stand against a wall near the center of the building, stand in a doorway, or crawl under heavy furniture (a desk or table). Stay away from windows and outside doors./If you're outdoors, stay outdoors and in the open away from power lines or anything that might fall. Stay away from buildings (stuff might fall off the building or the building could fall on you)./If you're in a car, stop the car and stay inside the car until the earthquake stops./Don't use elevators or light matches, candles, or any flame."
        let after: String = "Check yourself and others for injuries and provide first aid for anyone who needs it./If water, electricity, or gas lines are damaged, shut off the valves. If you do smell gas, open all the windows and doors, leave immediately, and call the authorities using someone else's phone./Stay away from damaged buildings or areas and be careful around broken glass, debris, and chimneys./Be wary of tsunamis, seiches, or aftershocks that may hit after the initial impact."
    }
    class Blizzard: Codable {
    let before: String = "Stock up on essentials./Charge your cell phone and make lists of emergency contacts./Prepare your vehicle for hazardous winter weather./Storm proof your home and make sure to stay indoors."
    
    let during: String = "Have an emergency medicine bag and stay indoors./Watch for frostbite and know the signs of hypothermia./Avoid alcohol and clear snow carefully./ Drive very carefully, if at all."
    
    
    let after: String = "From your front door, check to see if there are any power lines in your yard./Check for broken water pipes and shut off the water supply until a professional is able to come and repair them./Look around your home and check for any broken or shattered windows. Temporary fixes include covering them with plywood or taping blankets for insulation./ Listen to a radio for any roadblocks or emergency announcements."
}
class Storm: Codable {
    let before: String = "Check that loose items such as outdoor settings, umbrellas and trampolines are safely secured./If it is safe to do so, check gutters, downpipes and drains are not blocked./Park your car undercover and away from trees./Take the advice of local authorities. Evacuate if ordered."
    let during: String = "Stay indoors and away from windows./If outdoors, shelter away from drains, gutters, creeks and waterways./Be prepared for power outages./Floodwater is dangerous and toxic – never drive, swim, walk or ride through floodwater."
    let after: String = "Check your home and property for damage./Keep clear of damaged buildings, powerlines and trees./Be aware of road hazards such as floodwater, debris and damaged roads or bridges./Do not drive through affected areas unless it is necessary."
}


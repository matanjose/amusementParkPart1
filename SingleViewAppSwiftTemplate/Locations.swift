//
//  Locations.swift
//  SingleViewAppSwiftTemplate
//
//  Created by José Francisco Portuondo-Dember on 10/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
//Locations

class Location {
    let name: String
    var locationType: Area?
    var swipeType: SwipeType?
    
    init(name: String) {
        self.name = name
    }
    
    func swipe(name: Entrant) {
    }
    
   
}

class EntryPoint: Location {
    override var locationType: Area? { get {
        return .amusement
        }
        set {}
    }
    override var swipeType: SwipeType? { get {
        return .access
        }
        set {}
    }
    override func swipe(name: Entrant) {
        let permission = name.entrantType.canAccess
        let accessType = self.locationType
        /*
        //Checking for required information
        switch name.entrantType {
        case .classicGuest,.vipGuest:
            break
        case .freeChildGuest:
            //check that there is a birthdate, and that it is less than five years from today
            if name.birthdate == nil {
                print("Requirede birthdate information is missing, please go to customer service to provide this information")
            } else {
 
            }
        }
        */
        if permission.contains(accessType!) {
            print("Access to \(self.name) granted")
        } else {
            print("Access to \(self.name) denied")
        }
    }
}

class Ride: Location {
    override var locationType: Area? {
        get { return .amusement }
        set {}
    }
    override var swipeType: SwipeType? { get {
        return .rides
        }
        set {}
    }
    override func swipe(name: Entrant) {
        let priviledges = name.entrantType.hasRidePrivilegesTo
        if priviledges.contains(.accessAllRides) {
            print("Entrant may ride \(self.name)")
        } else {
            print("Entrant may not ride \(self.name)")
        }
        if priviledges.contains(.skipLines) {
            print("Entrant may skip lines for \(self.name)")
        } else {
            return
        }
    }
}

class Shopping: Location {
    override var locationType: Area? {
        get {return .amusement}
        set {}
    }
    override var swipeType: SwipeType? { get {
        return .discounts
        }
        set {}
    }
    
    override func swipe(name: Entrant) {
        let discounts = name.entrantType.receivesDiscountOn
        if discounts != [] {
            print("Entrant is entitled to the following discounts:")
            for discount in discounts {
                switch discount {
                case .food10: print("10% off on food")
                case .food15: print("15% off on food")
                case .food25: print("25% off on food")
                case.merchandise20: print("20% off on merchandise")
                case .merchandise25: print("25% off on merchandise")
                }
            }
        } else {
            print("Entrant is not entitled to any discounts.")
        }
    }
}



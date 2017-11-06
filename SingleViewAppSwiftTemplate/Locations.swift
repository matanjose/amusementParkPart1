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
    
    func swipe(pass: Pass) {
       
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
    override func swipe(pass: Pass) {
        let passIsValid = checkIfStillAValid(pass: pass)
        let accessType = self.locationType
        let authorization = pass.entrantType.canAccess.contains(accessType!)
        switch (authorization, passIsValid) {
        case (true, true):
            print("Welcome! Enjoy the park.")
            checkIfBirthday(of: pass)
        case (true, false):
            print("Welcome! \(expiredPassMessage)")
        case(false, false), (false, true):
            print("Unfortunately you do not have access, please see customer service")
        
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
    override func swipe(pass: Pass) {
        let passIsValid = checkIfStillAValid(pass: pass)
        let priviledges = pass.entrantType.hasRidePrivilegesTo
        switch passIsValid {
        case true:
            if priviledges.contains(.accessAllRides) {
                print("Entrant may ride \(self.name)")
            } else {
                print("Entrant may not ride \(self.name)")
            }
            if priviledges.contains(.skipLines) {
                print("Entrant may skip lines for \(self.name)")
            }
        case false:
            print("\(expiredPassMessage) We look forward to seeing you soon at \(self.name)")
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
    
    override func swipe(pass: Pass) {
        let passIsValid = checkIfStillAValid(pass: pass)
        switch passIsValid {
        case true:
            let discounts = pass.entrantType.receivesDiscountOn
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
        case false:
            print("\(expiredPassMessage)")
        }
    }
}

class EmployeeArea: Location {
    init(name: String, location: Area) {
        super.init(name: name)
        self.locationType = location
    }
    
    override func swipe(pass: Pass) {
        let passIsValid = checkIfStillAValid(pass: pass)
        let accessType = self.locationType
        let authorization = pass.entrantType.canAccess.contains(accessType!)
        switch (authorization, passIsValid) {
        case (true, true):
            print("Access Granted")
        case(true, false),(false, false), (false, true):
            print("Access Denied")
        }
    }
}


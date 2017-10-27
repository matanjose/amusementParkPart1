//
//  Entrant.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jose Portuondo-Dember on 9/11/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class Entrant  {
    let entrantType: PersonOfType
    
    init(entrantType: PersonOfType) {
        self.entrantType = entrantType
    }
}

extension Entrant {
    func checkAreaAccess() {
        let areaAccess = self.entrantType.canAccess
        for area in areaAccess {
            if area == .amusement { print("Entrant may access Amusement areas")}
            if area == .kitchen { print("Entrant may access kitchen areas")}
            if area == .maintenance { print("Entrant may access maintenance areas")}
            if area == .office { print("Entrant may access office areas")}
            if area == .rideControl { print("Entrant may access ride control areas")}
        }
    }
    
    func checkDiscountAccess() {
        let discounts = self.entrantType.receivesDiscountOn
        for discount in discounts {
            if discount == .food10 { print("Entrant receives a 10% discount on food")}
            if discount == .food15 { print("Entrant receives a 15% discount on food")}
            if discount == .merchandise20 { print("Entrant receives a 20% discount on merchandise")}
            if discount == .merchandise25 { print("Entrant receives a 35% discount on merchandise")}
        }
    }
    
    func checkRidePrivileges() {
        let ridePrivileges = self.entrantType.hasRidePrivilegesTo
        for privilege in ridePrivileges {
            if privilege == .accessAllRides { print("Entrant may access all rides")}
            if privilege == .skipLines { print("Entrant may skip lines") }
           
        }
    }
}



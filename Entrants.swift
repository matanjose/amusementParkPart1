//
//  Entrant.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jose Portuondo-Dember on 9/11/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class Entrant {
    var firstName: String?
    var lastName: String?
    var birthdate: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    
    init() {}
    
    init(firstName: String?, lastName: String?, birthdate: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthdate = birthdate
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
    
    
    var entrantType: PersonOfType? {
        
        get { return .classicGuest}
        set {}
    }
}


class VIPGuest: Entrant {
   
    override var entrantType: PersonOfType? { get {
        return .vipGuest
        }
        set {}
    }
 
}

class FreeChildGuest: Entrant {
  
    override var entrantType: PersonOfType? { get {
        return .freeChildGuest
        }
        set {}
    }
}

class Employee: Entrant {
    var employeeType: PersonOfType?
    init(firstName: String?, lastName: String?, birthday: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, employeeType: PersonOfType?) {
        self.employeeType = employeeType
        super.init()
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
    override var entrantType: PersonOfType? { get {
        return employeeType
        }
        set {}
    }
}



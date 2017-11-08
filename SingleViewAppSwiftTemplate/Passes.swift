//
//  Passes.swift
//  SingleViewAppSwiftTemplate
//
//  Created by José Francisco Portuondo-Dember on 11/6/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


struct Pass {
    let firstName: String?
    let lastName: String?
    let birthdayString: String?
    let streetAddress: String?
    let city: String?
    let state: String?
    let zipCode: String?
    let entrantType: PersonOfType
    let hashID: Int
    
    
    
    
//calculated information
    var birthdate: Date? {
        dateFormatter.dateStyle = DateFormatter.Style.short
        switch birthdayString {
        case .none:
            return nil
        case .some:
            let date = dateFormatter.date(from: birthdayString!)
            return date
        }
    }
}

extension Pass: Equatable {
    
    
    static func == (lhs: Pass, rhs: Pass) -> Bool {
        return
            lhs.birthdate == rhs.birthdate &&
            lhs.birthdayString == rhs.birthdayString &&
            lhs.city == rhs.city &&
            lhs.entrantType == rhs.entrantType &&
            lhs.firstName == rhs.firstName &&
            lhs.lastName == rhs.lastName &&
            lhs.state == rhs.state &&
            lhs.streetAddress == rhs.streetAddress &&
            lhs.zipCode == rhs.zipCode &&
            lhs.hashID == rhs.hashID
        
    }
}

func generatePass(from entrant: Entrant)  -> Pass {
    let firstName = entrant.firstName
    let lastName = entrant.lastName
    let birthdayString = entrant.birthdate
    let streetAddress = entrant.streetAddress
    let city = entrant.city
    let state = entrant.state
    let zipcode = entrant.zipCode
    let entrantType = entrant.entrantType
    let hashID = uniquePassID
    
    uniquePassID += 1
    return Pass(firstName: firstName, lastName: lastName, birthdayString: birthdayString, streetAddress: streetAddress, city: city, state: state, zipCode: zipcode, entrantType: entrantType, hashID: hashID)
    
    
}














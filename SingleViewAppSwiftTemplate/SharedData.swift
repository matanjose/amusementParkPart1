//
//  SharedData.swift
//  SingleViewAppSwiftTemplate
//
//  Created by José Francisco Portuondo-Dember on 11/1/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

//information for creating and comparing dates
let currentDate = Date()
var dateFormatter = DateFormatter()
let userCalendar = Calendar.current

//Information for invalid passes
let expiredPassMessage = "Unfortunately your pass is expired. Please see customer service for a new pass."

//Universally Available Functions
func generatePass(from entrant: Entrant)  -> Pass {
    let firstName = entrant.firstName
    let lastName = entrant.lastName
    let birthdayString = entrant.birthdate
    let streetAddress = entrant.streetAddress
    let city = entrant.city
    let state = entrant.state
    let zipcode = entrant.zipCode
    let entrantType = entrant.entrantType
    
    
    
    return Pass(firstName: firstName, lastName: lastName, birthdayString: birthdayString, streetAddress: streetAddress, city: city, state: state, zipCode: zipcode, entrantType: entrantType)
}



//
//  EntrantDatabase.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jose Portuondo-Dember on 8/27/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


//Guests
let classicGuestWBirthdate = Entrant(firstName: nil, lastName: nil, birthdate: "11/1/2000", streetAddress: nil, city: nil, state: nil, zipCode: nil)
let classicGuestPlain = Entrant()
let freeChildGuestExpired = FreeChildGuest(firstName: nil, lastName: nil, birthdate: "11/1/2000", streetAddress: nil, city: nil, state: nil, zipCode: nil)
let freeChildGuestNoBirthday = FreeChildGuest(firstName: nil, lastName: nil, birthdate: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil)
let freeChildGuestValid = FreeChildGuest(firstName: nil, lastName: nil, birthdate: "11/1/2015", streetAddress: nil, city: nil, state: nil, zipCode: nil)
let VIPGuestPlain = VIPGuest()

//Employees
let managerPlain = Employee(firstName: "Manager", lastName: "Joe", birthday: nil, streetAddress: "StreetA", city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .manager)
let foodPlain = Employee(firstName: "FoodServices", lastName: "Bob", birthday: nil, streetAddress: "StreetB", city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .foodServices)
let ridePlain = Employee(firstName: "RideServices", lastName: "Nick", birthday: nil, streetAddress:  "StreetC", city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .rideServices)
let maintenancePlain = Employee(firstName: "Maintenance", lastName: "Jill", birthday: nil, streetAddress: "StreetD", city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .maintenanceWorker)
let employeeNoType = Employee(firstName: nil, lastName: nil, birthday: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil, employeeType: .foodServices)
let managerNoStreetAddress = Employee(firstName: "No Street Address", lastName: "Willie", birthday: nil, streetAddress: nil, city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .manager)


let classicGuestPlainPass = generatePass(from: classicGuestPlain)
let classicGuestWBirthdatePass = generatePass(from: classicGuestWBirthdate)
let freeChildGuestValidPass = generatePass(from: freeChildGuestValid)
let freeChildGuestExpiredPass = generatePass(from: freeChildGuestExpired)
let freeChildGuestNoBirthdayPass = generatePass(from: freeChildGuestNoBirthday)
let VIPGuestPlainPass = generatePass(from: VIPGuestPlain)
let managerPlainPass = generatePass(from: managerPlain)
let foodPlainPass = generatePass(from: foodPlain)
let ridePlainPass = generatePass(from: ridePlain)
let maintenancePlainPass = generatePass(from: maintenancePlain)
 let employeeNoTypePass = generatePass(from: employeeNoType)
let managerNoStreetAddressPass = generatePass(from: managerNoStreetAddress)

let testPasses: [Pass] = [
  //  classicGuestPlainPass,
 //   classicGuestWBirthdatePass,
 //   freeChildGuestValidPass, //should have access to amusement area, no errors
 //   freeChildGuestExpiredPass, //should get notice that pass is expired, no errors
  //  freeChildGuestNoBirthdayPass, //should throw invalid data error
 //   VIPGuestPlainPass,
   managerPlainPass,
 //   foodPlainPass,
 //   ridePlainPass,
 //   maintenancePlainPass
 //   employeeNoTypePass //should throw invalid data error
        managerNoStreetAddressPass
]


















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
let freeChildGuestExpired = FreeChildGuest(firstName: nil, birthdate: "11/1/2000")
let freeChildGuestNoBirthday = FreeChildGuest(firstName: nil, birthdate: nil)
let freeChildGuestValid = FreeChildGuest(firstName: nil, birthdate: "11/1/2015")
let VIPGuestPlain = VIPGuest()

//Employees
let managerPlain = Employee(firstName: "Manager", lastName: "Joe", streetAddress: "StreetA", city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .manager)
let foodPlain = Employee(firstName: "FoodServices", lastName: "Bob", streetAddress: "StreetB", city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .foodServices)
let ridePlain = Employee(firstName: "RideServices", lastName: "Nick", streetAddress: "StreetC", city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .rideServices)
let maintenancePlain = Employee(firstName: "Maintenance", lastName: "Jill", streetAddress: "StreetD", city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .maintenanceWorker)


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

let testPasses: [Pass] = [classicGuestPlainPass, classicGuestWBirthdatePass, freeChildGuestValidPass, freeChildGuestExpiredPass, freeChildGuestNoBirthdayPass, VIPGuestPlainPass, managerPlainPass, foodPlainPass, ridePlainPass, maintenancePlainPass]


















//
//  EntrantDatabase.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jose Portuondo-Dember on 8/27/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

//Sample Passes - No Errors
        //Guests
let classicGuestBasic = Entrant()
let classicGuestBirthdayName = Entrant(firstName: "Bob", lastName: "Smith", birthdate: "11/2/2017", streetAddress: nil, city: nil, state: nil, zipCode: nil)
let classicGuestBirthdayNoName = Entrant(firstName: nil, lastName: nil, birthdate: "11/2/2016", streetAddress: nil, city: nil, state: nil, zipCode: nil)

let vipGuest = VIPGuest()

let freeChildGuestValid = FreeChildGuest(firstName: "Baby", lastName: "Smith", birthdate: "11/2/2015", streetAddress: nil, city: nil, state: nil, zipCode: nil)

        //Employees
let manager = Employee(firstName: "Harry", lastName: "Potter", birthday: nil, streetAddress: "StreetA", city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .manager)
let food = Employee(firstName: "Luna", lastName: "Lovegood", birthday: nil, streetAddress: "StreetB", city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .foodServices)
let rideServices = Employee(firstName: "Ron", lastName: "Weasley", birthday: nil, streetAddress:  "StreetC", city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .rideServices)
let maintenanceWorker = Employee(firstName: "Dobby", lastName: "Elf", birthday: nil, streetAddress: "StreetD", city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .maintenanceWorker)

var classicGuestBasicPass = generatePass(from: classicGuestBasic)
var classicGuestBirthdayNamePass = generatePass(from: classicGuestBirthdayName)
var classicGuestBirthdayNoNamePass = generatePass(from: classicGuestBirthdayNoName)
var freeChildGuestValidPass = generatePass(from: freeChildGuestValid)
var vipGuestPass = generatePass(from: vipGuest)
var managerPass = generatePass(from: manager)
var foodPass = generatePass(from: food)
var rideServicesPass = generatePass(from: rideServices)


let errorFreeTestPasses: [Pass] = [
    classicGuestBasicPass,
    classicGuestBirthdayNamePass,
    classicGuestBirthdayNoNamePass,
    freeChildGuestValidPass,
    vipGuestPass,
    managerPass,
    foodPass,
    rideServicesPass
]


















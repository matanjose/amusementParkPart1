//
//  EntrantDatabase.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jose Portuondo-Dember on 8/27/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


/*
 ---------------------------------------------------------------------
Sample Passes - No Errors (Samples with Errors Below)
 ---------------------------------------------------------------------
 */
        //Guests
let classicGuestBasic = Entrant()
            //Change birthdays below so that month and day are SAME as current month and day, format MM/DD/YYYY
let classicGuestBirthdayName = Entrant(firstName: "Bob", lastName: "Smith", birthdate: "11/8/2017", streetAddress: nil, city: nil, state: nil, zipCode: nil)
let classicGuestBirthdayNoName = Entrant(firstName: nil, lastName: nil, birthdate: "11/8/2016", streetAddress: nil, city: nil, state: nil, zipCode: nil)
            //Change birthdays below so that month and day are DIFFERENT from current month and day, format MM/DD/YYYY
let classicGuestNotBirthday = Entrant(firstName: nil, lastName: nil, birthdate: "10/2/2000", streetAddress: nil, city: nil, state: nil, zipCode: nil)
let vipGuest = VIPGuest()
            //Make sure that birthdate below is < five years from current date
let freeChildGuestValid = FreeChildGuest(firstName: "Baby", lastName: "Smith", birthdate: "11/2/2015", streetAddress: nil, city: nil, state: nil, zipCode: nil)
            //Make sure that birthdate below is > five years from current date
let freeChildGuestExpired = FreeChildGuest(firstName: "Baby", lastName: "Smith", birthdate: "11/2/2000", streetAddress: nil, city: nil, state: nil, zipCode: nil)

        //Employees
let manager = Employee(firstName: "Harry", lastName: "Potter", birthday: nil, streetAddress: "StreetA", city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .manager)
let food = Employee(firstName: "Luna", lastName: "Lovegood", birthday: nil, streetAddress: "StreetB", city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .foodServices)
let rideServices = Employee(firstName: "Ron", lastName: "Weasley", birthday: nil, streetAddress:  "StreetC", city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .rideServices)
let maintenanceWorker = Employee(firstName: "Dobby", lastName: "Elf", birthday: nil, streetAddress: "StreetD", city: "CapitalCity", state: "ZZ", zipCode: "12345", employeeType: .maintenanceWorker)

let classicGuestBasicPass = generatePass(from: classicGuestBasic)
let classicGuestBirthdayNamePass = generatePass(from: classicGuestBirthdayName)
let classicGuestBirthdayNoNamePass = generatePass(from: classicGuestBirthdayNoName)
let classicGuestNotBirthdayPass = generatePass(from: classicGuestNotBirthday)
let freeChildGuestValidPass = generatePass(from: freeChildGuestValid)
let freeChildGuestExpiredPass = generatePass(from: freeChildGuestExpired)
let vipGuestPass = generatePass(from: vipGuest)
let managerPass = generatePass(from: manager)
let foodPass = generatePass(from: food)
let rideServicesPass = generatePass(from: rideServices)
let maintenanceWorkerPass = generatePass(from: maintenanceWorker)


let errorFreeTestPasses: [Pass] = [
            //Guest Passes
    
   // classicGuestBasicPass,
   // classicGuestBirthdayNamePass,
  //  classicGuestBirthdayNoNamePass,
 //   classicGuestNotBirthdayPass,
  //  freeChildGuestValidPass,
//     freeChildGuestExpiredPass,
//  vipGuestPass,
    
            //Employee Passes

 //   managerPass,
 //   foodPass,
//   rideServicesPass,
//   maintenanceWorkerPass
]

/*
 ------------------------------
 Sample Passes - Errors
 ------------------------------
 */

                //Guests

let freeChildGuestNoBirthdate = FreeChildGuest(firstName: "Tom", lastName: "Riddle", birthdate: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil)

                //Employees
let kitchenNoFirstName = Employee(firstName: nil, lastName: "Hagrid", birthday: nil, streetAddress: "Some Street", city: "Some City", state: "ZZ", zipCode: "12345", employeeType: .foodServices)
let managerNoLastName = Employee(firstName: "Winky", lastName: nil, birthday: nil, streetAddress: "Some Street", city: "Some City", state: "ZZ", zipCode: "12345", employeeType: .manager)
let maintenanceNoStreet = Employee(firstName: "Neville", lastName: "Longbottom", birthday: nil, streetAddress: nil, city: "Some City", state: "ZZ", zipCode: "12345", employeeType: .maintenanceWorker)
let rideServicesNoCity = Employee(firstName: "Draco", lastName: "Malfoy", birthday: nil, streetAddress: "Some Street", city: nil, state: "ZZ", zipCode: "12345", employeeType: .rideServices)
let managerNoState = Employee(firstName: "Albus", lastName: "Dumbledore", birthday: nil, streetAddress: "Some Street", city: "Some City", state: nil, zipCode: "12345", employeeType: .manager)
let managerNoZip = Employee(firstName: "Minerva", lastName: "McGonnegal", birthday: nil, streetAddress: "Some Street", city: "Some City", state: "ZZ", zipCode: nil, employeeType: .manager)



let freeChildGuestNoBirthdatePass = generatePass(from: freeChildGuestNoBirthdate)
let kitchenNoFirstNamePass = generatePass(from: kitchenNoFirstName)
let managerNoLastNamePass = generatePass(from: managerNoLastName)
let maintenanceNoStreetPass = generatePass(from: maintenanceNoStreet)
let rideServicesNoCityPass = generatePass(from: rideServicesNoCity)
let managerNoStatePass = generatePass(from: managerNoState)
let managerNoZipPass = generatePass(from: managerNoZip)

let examplePassesWithErrors: [ Pass ] = [
//    freeChildGuestNoBirthdatePass, //will throw an error at any location because birthdate is necessary to validate a Free Child Guest Pass
//    kitchenNoFirstNamePass,  //will throw an error at any location because first name is necessary to validate any Employee Pass
//    managerNoLastNamePass, //will throw an error at any location because last name is necessary to validate any Employee Pass
//    maintenanceNoStreetPass, //will throw an error at any location because street address is necessary to validate any Employee Pass
//    rideServicesNoCityPass, //will throw an error at any location because city is necessary to validate any Employee Pass
//    managerNoStatePass,  //will throw an error at any location because state is necessary to validate any Employee Pass
//    managerNoZipPass //will throw an error at any location because zipcode is necessary to validate any Employee Pass
]










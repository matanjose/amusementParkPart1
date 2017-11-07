//
//  LocationsDatabase.swift
//  SingleViewAppSwiftTemplate
//
//  Created by José Francisco Portuondo-Dember on 10/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

let northGate = EntryPoint(name: "North Gate Entry Point")
let rollerCoaster = Ride(name: "Russian Mountain Roller Coaster")
let mainStore = Shopping(name: "Main Store")
let kitchen = EmployeeArea(name: "Kitchen", location: .kitchen)
let office = EmployeeArea(name: "Office", location: .office)
let rideControl = EmployeeArea(name: "RideServices", location: .rideControl)
let maintenance = EmployeeArea(name: "Maintenance", location: .maintenance)

//to test specific areas, uncomment the line and it will be included in viewdidload()
let locationsCollection: [Location] = [ //comments describe who should be able to access if requisite data is provided
    northGate, //This is an entrance to the entire amusement park, Everyone can access. Will provide a happy birthday message if has correct data, otherwise will prompt for birthday info
    rollerCoaster, //Everyone can access, VIP can skip lines
    mainStore, //Demonstrates VIPGuest and Employee discounts
    kitchen, // Only manager, maintenance, and food service
    office, // Only manager
    rideControl, //Only manager, maintenance and ride services
    maintenance //Only manager and maintenance
]













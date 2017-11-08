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

//reSwipe
var previousPassSwiped: Pass? = nil
var previousSwipeTime: Date = Date.distantPast
var previousSwipeLoc: Location? = nil


//Information for invalid passes
let expiredPassMessage = "Unfortunately your pass is expired. Please see customer service for a new pass."

//Unique Pass ID
var uniquePassID = 1






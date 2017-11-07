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

//Timer Data
let initialSeconds = 5 //fixed time for timer to make sure resetting from a constant
var seconds = 5 //initial time for timer
var timer = Timer() //Creates the timer
var isTimerRunning = false //makes sure that we only have one timer created
var previousPassSwiped: Pass? = nil
var timeLeftUntilNextSwipe: Int = 0

//Information for invalid passes
let expiredPassMessage = "Unfortunately your pass is expired. Please see customer service for a new pass."

//Universally Available Functions




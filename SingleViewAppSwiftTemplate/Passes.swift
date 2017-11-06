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

func checkIfBirthday(of: Pass) {
        if of.birthdate != nil {
            let todayDateComponents = userCalendar.dateComponents([.month, .day], from: currentDate)
            let todayJustMonthAndDay = userCalendar.date(from: todayDateComponents)
            let birthdayDateComponents = userCalendar.dateComponents([.month, .day], from: of.birthdate!)
            let birthdateJustMonthAndDay = userCalendar.date(from: birthdayDateComponents)
            
            let birthdayComparison = userCalendar.compare(birthdateJustMonthAndDay!, to: todayJustMonthAndDay!, toGranularity: .day)
            
            switch (birthdayComparison, of.firstName) {
            case (.orderedSame, .some):
                    print("Happy Birthday, \(of.firstName!) we look forward to helping make it one of the best!")
            case (.orderedSame, .none):
                print("Happy Birthday! Let us know your name, so that next year we can give you a more personalized message.")
            default:
                break
            }
        } else {
            print("We don't have your birthday information on file. If you'd like a personalized greeting when you enter our park, please update your information with customer service")
        }
    }

func checkIfStillAValid(pass: Pass) -> Bool {
    switch pass.entrantType {
    case .classicGuest, .foodServices, .maintenanceWorker, .manager, .rideServices, .vipGuest:
        return true
    case .freeChildGuest :
            let todayDateComponents = userCalendar.dateComponents([.year, .month, .day], from: currentDate)
            let fiveYearsAgo = todayDateComponents.year! - 5
            
            var fiveYearsAgoTodayDateComponents = DateComponents()
            fiveYearsAgoTodayDateComponents.day = todayDateComponents.day
            fiveYearsAgoTodayDateComponents.month = todayDateComponents.month
            fiveYearsAgoTodayDateComponents.year = fiveYearsAgo
            let fiveYearsAgoToday = userCalendar.date(from: fiveYearsAgoTodayDateComponents)
            
            let dateComparison = userCalendar.compare(pass.birthdate!, to: fiveYearsAgoToday!, toGranularity: .day)
            switch dateComparison {
            case .orderedSame, .orderedDescending:
               return true
            case .orderedAscending:
                return false
                
                
            
        }
    }
}



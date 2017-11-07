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

func checkIfBirthday(of: Pass)  {
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
            print("We don't have your birthday information on file. If you'd like a personalized greeting when you enter our park on your birthday, please update your information with customer service.")
        }
    }

func checkIfStillAValid(pass: Pass) throws -> Bool {
    let passType = pass.entrantType.passType
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
            
            guard let bdate = pass.birthdate else {
                throw MissingRequiredData.noBirthDate(description: "Error: Birthday information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
            }
            
            let dateComparison = userCalendar.compare(bdate, to: fiveYearsAgoToday!, toGranularity: .day)
            switch dateComparison {
            case .orderedSame, .orderedDescending:
               return true
            case .orderedAscending:
                return false
        }
    }
}

func requiredDataFor(pass: Pass) throws {
    let requiredData: [ RequiredData] = pass.entrantType.dataRequiredForProfile
    let passType = pass.entrantType.passType
    if requiredData == [.none] {}
        
        
        for data in requiredData {
            switch data {
            case .birthdate:
                guard let testValue = pass.birthdate else {
                    let missingData = data.rawValue
                    print("Access Denied")
                    throw MissingRequiredData.noBirthDate(description: "Error: \(missingData)information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .firstName:
                    guard let testValue = pass.firstName else {
                        let missingData = data.rawValue
                        print("Access Denied")
                        throw MissingRequiredData.noFirstName(description: "Error: \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .lastName:
                guard let testValue = pass.lastName else {
                    let missingData = data.rawValue
                    print("Access Denied")
                    throw MissingRequiredData.noLastName(description: "Error: \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .streetAddress:
                guard let testValue = pass.streetAddress else {
                    let missingData = data.rawValue
                    print("Access Denied")
                    throw MissingRequiredData.noStreetAddress(description: "Error: \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .city:
                guard let testValue = pass.city else {
                    let missingData = data.rawValue
                    print("Access Denied")
                    throw MissingRequiredData.noCity(description: "Error: \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .state:
                guard let testValue = pass.state else {
                    let missingData = data.rawValue
                    print("Access Denied")
                    throw MissingRequiredData.noState(description: "Error: \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .zipCode:
                guard let testValue = pass.zipCode else {
                    let missingData = data.rawValue
                    print("Access Denied")
                    throw MissingRequiredData.noZipCode(description: "Error: \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .none: break
            }
        }
        
    }
    







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
    let hashID = 1
    
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

extension Pass: Equatable {
    
    
    static func == (lhs: Pass, rhs: Pass) -> Bool {
        return
            lhs.birthdate == rhs.birthdate &&
            lhs.birthdayString == rhs.birthdayString &&
            lhs.city == rhs.city &&
            lhs.entrantType == rhs.entrantType &&
            lhs.firstName == rhs.firstName &&
            lhs.lastName == rhs.lastName &&
            lhs.state == rhs.state &&
            lhs.streetAddress == rhs.streetAddress &&
            lhs.zipCode == rhs.zipCode &&
            lhs.hashID == rhs.hashID
        
    }
}

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
                throw MissingRequiredData.noBirthDate(description: "Error: This pass (ID: \(pass.hashID) is a \(passType) and requires birthdate information in order to be swiped. This data is either missing or invalid. Please provide the correct data")
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
                guard pass.birthdate != nil else {
                    let missingData = data.rawValue
                    print("Access Denied")
                    throw MissingRequiredData.noBirthDate(description: "Error: \(missingData)information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .firstName:
                    guard pass.firstName != nil else {
                        let missingData = data.rawValue
                        print("Access Denied")
                        throw MissingRequiredData.noFirstName(description: "Error: \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .lastName:
                guard pass.lastName != nil else {
                    let missingData = data.rawValue
                    print("Access Denied")
                    throw MissingRequiredData.noLastName(description: "Error: \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .streetAddress:
                guard pass.streetAddress != nil else {
                    let missingData = data.rawValue
                    print("Access Denied")
                    throw MissingRequiredData.noStreetAddress(description: "Error: \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .city:
                guard pass.city != nil else {
                    let missingData = data.rawValue
                    print("Access Denied")
                    throw MissingRequiredData.noCity(description: "Error: \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .state:
                guard pass.state != nil else {
                    let missingData = data.rawValue
                    print("Access Denied")
                    throw MissingRequiredData.noState(description: "Error: \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .zipCode:
                guard pass.zipCode != nil else {
                    let missingData = data.rawValue
                    print("Access Denied")
                    throw MissingRequiredData.noZipCode(description: "Error: \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .none: break
            }
        }
    }









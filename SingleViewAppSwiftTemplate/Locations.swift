//
//  Locations.swift
//  SingleViewAppSwiftTemplate
//
//  Created by José Francisco Portuondo-Dember on 10/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
//Locations

class Location {
    let name: String
    var locationType: Area?
    var swipeType: SwipeType?
    
    init(name: String) {
        self.name = name
    }
    
    func swipe(pass: Pass) {
       
    }
   
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        return
            lhs.name == rhs.name &&
        lhs.locationType == rhs.locationType &&
        lhs.swipeType == rhs.swipeType
        
    }
}

class EntryPoint: Location {
    override var locationType: Area? { get {
        return .amusement
        }
        set {}
    }
    override var swipeType: SwipeType? { get {
        return .access
        }
        set {}
    }
    override func swipe(pass: Pass) {
        do {
            try reswipeTooSoon(pass: pass)
            let passIsValid = try checkIfStillAValid(pass: pass)
            try requiredDataFor(pass: pass)
            let accessType = self.locationType
        let authorization = pass.entrantType.canAccess.contains(accessType!) //not actually an optional, will always have a value
        switch (authorization, passIsValid) {
        case (true, true):
            print("Welcome! Enjoy the park.")
            checkIfBirthday(of: pass)
        case (true, false):
            print("Welcome! \(expiredPassMessage)")
        case(false, false), (false, true):
            print("Unfortunately you do not have access, please see customer service")
        
        } 
        } catch SwipeError.swipeTooSoon(let description) {
            print(description)
        } catch SwipeError.missingRequiredData(let description) {
            print(description)
        } catch {
            print("There has been an unspecified error")
        }
        
    }
}

class Ride: Location {
    override var locationType: Area? {
        get { return .amusement }
        set {}
    }
    override var swipeType: SwipeType? { get {
        return .rides
        }
        set {}
    }
    override func swipe(pass: Pass) {
       
        do {
            try reswipeTooSoon(pass: pass)
            let passIsValid = try checkIfStillAValid(pass: pass)
            try requiredDataFor(pass: pass)
        let priviledges = pass.entrantType.hasRidePrivilegesTo
        switch passIsValid {
        case true:
            if priviledges.contains(.accessAllRides) {
                print("Entrant may ride \(self.name)")
            } else {
                print("Entrant may not ride \(self.name)")
            }
            if priviledges.contains(.skipLines) {
                print("Entrant may skip lines for \(self.name)")
            }
        case false:
            print("\(expiredPassMessage) We look forward to seeing you soon at \(self.name)")
        }
        } catch SwipeError.swipeTooSoon(let description) {
            print(description)
        } catch SwipeError.missingRequiredData(let description) {
            print(description)
        } catch {
            print("There has been an unspecified error")
        }
    }
}

class Shopping: Location {
    override var locationType: Area? {
        get {return .amusement}
        set {}
    }
    override var swipeType: SwipeType? { get {
        return .discounts
        }
        set {}
    }
    
    override func swipe(pass: Pass) {
        
        do {
            try reswipeTooSoon(pass: pass)
            let passIsValid = try checkIfStillAValid(pass: pass)
            try requiredDataFor(pass: pass)
        switch passIsValid {
        case true:
            let discounts = pass.entrantType.receivesDiscountOn
            if discounts != [] {
                print("Entrant is entitled to the following discounts:")
                for discount in discounts {
                    switch discount {
                    case .food10: print("10% off on food")
                    case .food15: print("15% off on food")
                    case .food25: print("25% off on food")
                    case.merchandise20: print("20% off on merchandise")
                    case .merchandise25: print("25% off on merchandise")
                    }
                }
            } else {
                print("Entrant is not entitled to any discounts.")
            }
        case false:
            print("\(expiredPassMessage)")
        }
        } catch SwipeError.swipeTooSoon(let description) {
            print(description)
        }catch SwipeError.missingRequiredData(let description) {
            print(description)
        }  catch {
            print("There has been an unspecified error")
        }
    }
}

class EmployeeArea: Location {
    init(name: String, location: Area) {
        super.init(name: name)
        self.locationType = location
    }
    
    override func swipe(pass: Pass) {
        
        do {
            try reswipeTooSoon(pass: pass)
            let passIsValid = try checkIfStillAValid(pass: pass)
            try requiredDataFor(pass: pass)
        
        let accessType = self.locationType
        let authorization = pass.entrantType.canAccess.contains(accessType!)
        switch (authorization, passIsValid) {
        case (true, true):
            print("Access Granted")
        case(true, false),(false, false), (false, true):
            print("Access Denied")
        }
        } catch SwipeError.swipeTooSoon(let description) {
            print(description)
        }catch SwipeError.missingRequiredData(let description) {
            print(description)
        } catch {
            print("There has been an unspecified error")
        }
    }
}

extension Location {
  
    
    func reswipeTooSoon(pass: Pass)  throws {
        let swipeTooSoonMessage: String = "Error When attempting to swipe at \(self.name): Swipe Too Soon — It has been less than 5 seconds since this pass (ID: \(pass.hashID)) was used at this location (\(self.name)). Please wait and swipe again."
        let swipeTime = Date()
        let timeSinceLastSwipe = swipeTime.timeIntervalSince(previousSwipeTime)
        let tooSoon = timeSinceLastSwipe < 5
        let samePerson = pass == previousPassSwiped
        let samePlace = self == previousSwipeLoc
        
        
        switch (samePerson, samePlace, tooSoon) {
        case (true, true, true):
            throw SwipeError.swipeTooSoon(description: swipeTooSoonMessage)
        default:
            previousSwipeTime = swipeTime //set the current swipe time as the previous swipe for next comparison
            previousPassSwiped = pass //sets the current Pass as the previous pass, for next comparison
            previousSwipeLoc = self //sets the current location as the previous location, for next comparison
            
        }
    }
}

extension Location {
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
                    throw SwipeError.missingRequiredData(description: "Error when attempting to swipe pass (ID:\(pass.hashID)) at \(self.name): Missing Data — \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .firstName:
                guard pass.firstName != nil else {
                  let  missingData = data.rawValue
                    print("Access Denied")
                    throw SwipeError.missingRequiredData(description: "Error when attempting to swipe pass (ID:\(pass.hashID)) at \(self.name): Missing Data — \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .lastName:
                guard pass.lastName != nil else {
                  let  missingData = data.rawValue
                    print("Access Denied")
                    throw SwipeError.missingRequiredData(description: "Error when attempting to swipe pass (ID:\(pass.hashID)) at \(self.name): Missing Data — \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .streetAddress:
                guard pass.streetAddress != nil else {
                  let   missingData = data.rawValue
                    print("Access Denied")
                    throw SwipeError.missingRequiredData(description: "Error when attempting to swipe pass (ID:\(pass.hashID)) at \(self.name): Missing Data — \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .city:
                guard pass.city != nil else {
                  let  missingData = data.rawValue
                    print("Access Denied")
                    throw SwipeError.missingRequiredData(description: "Error when attempting to swipe pass (ID:\(pass.hashID)) at \(self.name): Missing Data — \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .state:
                guard pass.state != nil else {
                  let  missingData = data.rawValue
                    print("Access Denied")
                    throw SwipeError.missingRequiredData(description: "Error when attempting to swipe pass (ID:\(pass.hashID)) at \(self.name): Missing Data — \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .zipCode:
                guard pass.zipCode != nil else {
                  let  missingData = data.rawValue
                    print("Access Denied")
                    throw SwipeError.missingRequiredData(description: "Error when attempting to swipe pass (ID:\(pass.hashID)) at \(self.name): Missing Data — \(missingData) information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
                }
            case .none: break
            }
        }
    }
}

extension Location {
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
                throw SwipeError.missingRequiredData(description: "Error when attempting to swipe pass (ID:\(pass.hashID)) at \(self.name): Missing Data — birthdate information is required for a \(passType). This data is either missing or invalid. Please provide the correct data")
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
}

extension Location {
    func checkIfBirthday(of: Pass)  {
        if of.birthdate != nil {
            let todayDateComponents = userCalendar.dateComponents([.month, .day], from: currentDate)
            let todayJustMonthAndDay = userCalendar.date(from: todayDateComponents)
            let birthdayDateComponents = userCalendar.dateComponents([.month, .day], from: of.birthdate!)
            let birthdateJustMonthAndDay = userCalendar.date(from: birthdayDateComponents)
            let birthdayComparison = userCalendar.compare(birthdateJustMonthAndDay!, to: todayJustMonthAndDay!, toGranularity: .day)
            switch (birthdayComparison, of.firstName) {
            case (.orderedSame, .some):
                print("Happy Birthday, \(of.firstName!)! We look forward to helping make it one of the best!")
            case (.orderedSame, .none):
                print("Happy Birthday! Let us know your name, so that next year we can give you a more personalized message.")
            default:
                break
            }
        } else {
            print("We don't have your birthday information on file. If you'd like a personalized greeting when you enter our park on your birthday, please update your information with customer service.")
        }
    }
}

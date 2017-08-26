//
//  People.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jose Portuondo-Dember on 8/24/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

enum PersonType {
    case classicGuest
    case vipGuest
    case freeChildGuest
}

struct entrant {
    let entrantType: PersonType
    var canAccess: [Area : Bool] {
        switch self.entrantType {
        case .classicGuest :
            return [.amusement : true, .kitchen : false, .maintenance : false, .office : false, .rideControl : false]
        case .freeChildGuest :
            return [.amusement : false, .kitchen : false, .maintenance : false, .office : false, .rideControl : true]
        case .vipGuest :
            return [.amusement : true, .kitchen : true, .maintenance : true, .office : true, .rideControl : true]
        }
    }
    
    func hasAccess(to: Area) -> Bool {
        if canAccess[to] == true {
            return true
        } else {
            return false
        }
    }
}

let classicGuest = entrant(entrantType: .classicGuest)
let freeChildGuest = entrant(entrantType: .freeChildGuest)
let vipGuest = entrant(entrantType: .vipGuest)



/*
let accessDict = vipGuest.canAccess
let kitchenAccess = accessDict[.kitchen]

func printKitchenAccess() {
    let finalKitchenAccess = kitchenAccess!
    print(finalKitchenAccess)
}
*/


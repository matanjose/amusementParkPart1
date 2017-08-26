//
//  Entrant.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jose Portuondo-Dember on 6/20/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

enum Entrant {
    case classicGuest
    case vipGuest
    case freeChildGuest
    case employeeFoodServices
    case employeeRideServices
    case employeeMaintenance
    case manager
}

enum AreaAccess {
    case amusementAreas
    case kitchenAreas
    case rideControlAreas
    case MaintenanceAreas
    case officeAreas
}



extension Entrant {
    var areaAccess: [AreaAccess : Bool] {
        switch self {
        case .classicGuest, .vipGuest, .freeChildGuest: return [
            AreaAccess.amusementAreas : true,
            AreaAccess.kitchenAreas : false,
            AreaAccess.MaintenanceAreas : false,
            AreaAccess.officeAreas : false,
            AreaAccess.rideControlAreas : false]
        case .employeeFoodServices: return [
            AreaAccess.amusementAreas : true,
            AreaAccess.kitchenAreas : true,
            AreaAccess.MaintenanceAreas : false,
            AreaAccess.officeAreas : false,
            AreaAccess.rideControlAreas : false]
        case .employeeRideServices: return [
            AreaAccess.amusementAreas : true,
            AreaAccess.kitchenAreas : false,
            AreaAccess.MaintenanceAreas : false,
            AreaAccess.officeAreas : false,
            AreaAccess.rideControlAreas : true]
        case .employeeMaintenance: return [
            AreaAccess.amusementAreas : true,
            AreaAccess.kitchenAreas : true,
            AreaAccess.MaintenanceAreas : true,
            AreaAccess.officeAreas : false,
            AreaAccess.rideControlAreas : true]
        case .manager: return [
            AreaAccess.amusementAreas : true,
            AreaAccess.kitchenAreas : true,
            AreaAccess.MaintenanceAreas : true,
            AreaAccess.officeAreas : true,
            AreaAccess.rideControlAreas : true]
        }
    }
}

var shadyLady = Entrant.classicGuest

































//
//  Errors.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jose Portuondo-Dember on 8/28/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

enum MissingRequiredData: Error {
    case noBirthDate(description: String)
    case noAccessType(description: String)
   case noFirstName(description: String)
    case noLastName(description: String)
    case noStreetAddress(description: String)
    case noCity(description: String)
    case noState(description: String)
    case noZipCode(description: String)
}
enum SwipeError: Error {
    case swipeTooSoon(description: String)
}

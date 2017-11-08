//
//  Errors.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jose Portuondo-Dember on 8/28/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


enum SwipeError: Error {
    case swipeTooSoon(description: String)
    case missingRequiredData(description: String)
}

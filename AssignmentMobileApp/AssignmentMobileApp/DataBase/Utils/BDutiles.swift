//
//  BDutiles.swift
//  AssignmentMobileApp
//
//  Created by Pallam Madhukar on 4/17/25.
//

import Foundation
import SQLite

import Foundation
import SQLite

extension Binding {
    func getDouble() -> Double {
        return Double((self as! Double).datatypeValue)
    }
    func getString() -> String {
        return String((self as! String).datatypeValue)
    }
    func getBool() -> Bool {
        return ((self as! Bool).datatypeValue != 0)
    }
}

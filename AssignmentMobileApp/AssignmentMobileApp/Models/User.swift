//
//  User.swift
//  AssignmentMobileApp
//
//  Created by Pallam Madhukar on 4/17/25.
//

import Foundation

public struct User:Identifiable  {
    public var id = UUID()
    var AccountType : String
    var userName : String
    var Password : String;
    
}

//
//  dbError.swift
//  AssignmentMobileApp
//
//  Created by Pallam Madhukar on 4/17/25.
//

import Foundation

enum DbError : Error {
    case failedToPrepare
    case failedToRun
    case failedToInsert
    case failedToDelete
    case failedToUpdate
    case userNotFound
    case noDataFound(message:String)
}

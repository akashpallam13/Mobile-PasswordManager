//
//  DbUtils.swift
//  AssignmentMobileApp
//
//  Created by Pallam Madhukar on 4/17/25.
//

import Foundation
enum DbResult<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}

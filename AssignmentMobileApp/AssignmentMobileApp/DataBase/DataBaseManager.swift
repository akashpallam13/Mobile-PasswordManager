//
//  DataBaseManager.swift
//  AssignmentMobileApp
//
//  Created by Pallam Madhukar on 4/17/25.
//

import Foundation
import SwiftUI
import SQLite
import Foundation
import SQLite

class DatabaseManager {
    static let shared = DatabaseManager()

    let connection: Connection

    private init() {
        do {
            let documentDirectory = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true
            )
            let fileUrl = documentDirectory.appendingPathComponent("password_manager").appendingPathExtension("sqlite3")
            connection = try Connection(fileUrl.path)
            print("✅ SQLite database initialized at: \(fileUrl.path)")
        } catch {
            fatalError("❌ Unable to initialize database: \(error)")
        }
    }
    
    func CreatedataBase() -> Connection{
        return connection
    }
    func createTables() {
        UserTable.shared.create()
    }
}

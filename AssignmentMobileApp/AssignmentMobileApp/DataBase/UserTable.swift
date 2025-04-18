//
//  UserTable.swift
//  AssignmentMobileApp
//
//  Created by Pallam Madhukar on 4/17/25.
//import SQLite
import SQLite
import Foundation
import CryptoKit

struct CryptoHelper {
    private static let key = SymmetricKey(size: .bits256)

    static func encrypt(_ string: String) -> String? {
        guard let data = string.data(using: .utf8) else { return nil }
        do {
            let sealedBox = try AES.GCM.seal(data, using: key)
            return sealedBox.combined?.base64EncodedString()
        } catch {
            print("Encryption error: \(error)")
            return nil
        }
    }

    static func decrypt(_ base64: String) -> String? {
        guard let combinedData = Data(base64Encoded: base64) else { return nil }
        do {
            let sealedBox = try AES.GCM.SealedBox(combined: combinedData)
            let decryptedData = try AES.GCM.open(sealedBox, using: key)
            return String(data: decryptedData, encoding: .utf8)
        } catch {
            print("Decryption error: \(error)")
            return nil
        }
    }
}

class UserTable {
    static let shared = UserTable()

    private let users = Table("Users")
    private let id = Expression<String>("Id")
    private let accountType = Expression<String>("AccountType")
    private let userName = Expression<String>("UserName")
    private let password = Expression<String>("Password")

    func create() {
        do {
            let db = DatabaseManager.shared.connection // must be of type `Connection`
            
            print("🧨 Dropping old table...")
            try db.run(users.drop(ifExists: true))

            print("🛠 Creating table...")
            try db.run(users.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(accountType)
                table.column(userName)
                table.column(password)
            })

            print("✅ Users table created successfully.")
        } catch {
            print("❌ Failed to create users table: \(error)")
        }
    }


    func insertUser(accountType: String, userName: String, password: String, completion: @escaping (DbResult<User, DbError>) -> Void) {
        guard !accountType.isEmpty, !userName.isEmpty, !password.isEmpty else {
            completion(.failure(.failedToInsert))
            return
        }

        let newId = UUID().uuidString

        guard let encryptedPassword = CryptoHelper.encrypt(password) else {
            print("❌ Password encryption failed")
            completion(.failure(.failedToInsert))
            return
        }

        let insert = users.insert(
            self.id <- newId,
            self.accountType <- accountType,
            self.userName <- userName,
            self.password <- encryptedPassword
        )

        do {
            try DatabaseManager.shared.connection.run(insert)
            print("✅ Inserted user with ID: \(newId)")
            let newUser = User(id: UUID(uuidString: newId)!, AccountType: accountType, userName: userName, Password: password)
            completion(.success(newUser))
        } catch {
            print("❌ Insert error: \(error)")
            completion(.failure(.failedToInsert))
        }
    }

    func getAllUsers(completion: @escaping (DbResult<[User], DbError>) -> Void) {
        var userList: [User] = []

        do {
            for row in try DatabaseManager.shared.connection.prepare(users) {
                let idString = row[id]
                guard let uuid = UUID(uuidString: idString) else { continue }
                let accountTypeVal = row[accountType]
                let userNameVal = row[userName]
                let encryptedPassword = row[password]
                let decryptedPassword = CryptoHelper.decrypt(encryptedPassword) ?? ""

                let user = User(
                    id: uuid,
                    AccountType: accountTypeVal,
                    userName: userNameVal,
                    Password: decryptedPassword
                )
                userList.append(user)
            }
            completion(.success(userList))
        } catch {
            print("❌ Failed to fetch users using prepared statement: \(error)")
            completion(.failure(.failedToPrepare))
        }
    }
    func deleteUser(id: UUID, completion: @escaping (DbResult<Bool, DbError>) -> Void) {
          do {
              let userToDelete = users.filter(self.id == id.uuidString)
              let deleteQuery = userToDelete.delete()

              try DatabaseManager.shared.connection.run(deleteQuery)
              print("✅ User with ID \(id) deleted successfully.")
              completion(.success(true))
          } catch {
              print("❌ Delete error: \(error)")
              completion(.failure(.failedToDelete))
          }
      }

      // Update user method
      func updateUser(user: User, completion: @escaping (DbResult<Bool, DbError>) -> Void) {
          let userToUpdate = users.filter(self.id == user.id.uuidString)
          let encryptedPassword = CryptoHelper.encrypt(user.Password) ?? ""

          let updateQuery = userToUpdate.update(
              self.accountType <- user.AccountType,
              self.userName <- user.userName,
              self.password <- encryptedPassword
          )

          do {
              try DatabaseManager.shared.connection.run(updateQuery)
              print("✅ User with ID \(user.id) updated successfully.")
              completion(.success(true))
          } catch {
              print("❌ Update error: \(error)")
              completion(.failure(.failedToUpdate))
          }
      }
}

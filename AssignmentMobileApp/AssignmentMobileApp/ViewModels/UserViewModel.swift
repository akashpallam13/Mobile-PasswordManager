//
//  UserViewModel.swift
//  AssignmentMobileApp
//
//  Created by Pallam Madhukar on 4/17/25.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    init() {
            UserTable.shared.create()
            loadUsers()
        }

        func loadUsers() {
            UserTable.shared.getAllUsers() { result in
                switch result {
                case .success(let fetchedUsers):
                    DispatchQueue.main.async {
                        self.users = fetchedUsers
                        print("Loaded users: \(fetchedUsers)")  //
                    }
                case .failure(let error):
                    print("Error loading users: \(error)")
                }
            }
        }
    func loadUserss() {
            UserTable.shared.getAllUsers { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let fetchedUsers):
                        self.users = fetchedUsers
                    case .failure(let error):
                        print("❌ Load error: \(error)")
                    }
                }
            }
        }
    func addUser(accountType: String, userName: String, password: String, completion: @escaping (Bool)  -> Void) {
        UserTable.shared.insertUser(accountType: accountType, userName: userName, password: password) { result in
            DispatchQueue.main.async {
                if case .success = result {
                    self.loadUsers()
                    completion(true)
                }
                else {
                    print("Add user failed")
                }
            }
        }
    }



    func deleteUser(id: UUID) {
        UserTable.shared.deleteUser(id: id) { result in
                if case .success = result {
                    self.loadUsers()
                }
            }
        }
    func updateUser(user: User) {
            UserTable.shared.updateUser(user: user) { result in
                if case .success = result {
                    self.loadUsers()
                }
            }
        }
}

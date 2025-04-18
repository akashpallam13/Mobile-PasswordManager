//
//  AssignmentMobileAppApp.swift
//  AssignmentMobileApp
//
//  Created by Pallam Madhukar on 4/17/25.
//

import SwiftUI

@main
struct AssignmentMobileAppApp: App {
    var body: some Scene {
        WindowGroup {
          HomeView()
                .environmentObject(UserViewModel())
        }
    }
}

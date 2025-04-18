//
//   AddUserView.swift
//  AssignmentMobileApp
//
//  Created by Pallam Madhukar on 4/17/25.
//

import SwiftUI

struct AddUserView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: UserViewModel
    @State private var AccountType = ""
    @State private var userName = ""
    @State private var Password = ""
    var onSave: (String, String, String) -> Void
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20) {
                TextField("Account Name", text: $AccountType)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Username / Email", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $Password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Add New Account") {
                    guard !AccountType.isEmpty, !userName.isEmpty, !Password.isEmpty else { return }
                    onSave(AccountType, userName, Password)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(20)
                
                Spacer()
            }
            .padding()
        }
    }
}


#Preview {
    AddUserView{_, _, _ in}
    .environmentObject(UserViewModel())
}

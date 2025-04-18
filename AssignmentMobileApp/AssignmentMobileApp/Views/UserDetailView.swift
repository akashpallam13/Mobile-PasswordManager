//
//  UserDetileView.swift
//  AssignmentMobileApp
//
//  Created by Pallam Madhukar on 4/17/25.
//

import SwiftUI
struct  UserDetailView: View {
    var user: User
    var onDelete: () -> Void
  //  @Environment(\.dismiss) var dismiss
    var  onEdit: (User) -> Void
    var body: some View {
        NavigationView{
            VStack(alignment:.leading){
                Text("Account Details")
                    .font(.headline)
                    .foregroundStyle(Color.blue)

                Text("\(user.AccountType)")
                    .font(.title2)
                Text("\(user.userName)")
                    .font(.title2)
                Text(user.Password)
                        .font(.body)

                HStack {
                    Button("Edit") {
                        guard !user.AccountType.isEmpty, !user.userName.isEmpty, !user.Password.isEmpty else { return
                        }
                        onEdit(user)
                    }
                    .padding()
                    .frame(width: 150,height: 50)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                
                        .padding(20)
                    Button("Delete") {
                        onDelete()
                     //   dismiss()
                    }
                    .padding(20)
                    .frame(width: 150,height: 50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                  
                }
               
                
            }
            .padding()
        }//.navigationTitle("Account Detiles")
          //  .background(Color.blue)
    }
}
#Preview {
    UserDetailView(user: User(id: UUID(), AccountType: "Google", userName: "example@gmail.com", Password: "password123"), onDelete: {}, onEdit: {_ in })
        .environmentObject(UserViewModel())
}


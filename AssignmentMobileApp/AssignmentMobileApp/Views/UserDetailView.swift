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
    @State private var isVisible = false
  
    var  onEdit: (User) -> Void
    var body: some View {
        NavigationView{
        
            VStack(alignment:.leading){
                Spacer()
                Text("Account Details")
                    .font(.headline)
                    .foregroundStyle(Color.blue)
                    .padding()
                VStack (alignment:.leading){
                    Text("Acount Type")
                    Text("\(user.AccountType)")
                        .font(.title2)
                }.padding()
                VStack(alignment:.leading) {
                    Text("UserName /Email")
                    Text("\(user.userName)")
                        .font(.title2)
                }
                .padding()
                HStack {
                    VStack (alignment:.leading){
                        
                        Text("Password")
                        if isVisible {
                            Text(user.Password)
                                .font(.body)
                        } else {
                            Text(String(repeating: "•", count: user.Password.count))
                                .font(.body)
                        }
                    }
                    .padding()
                    HStack{
                        Button(action:{  isVisible.toggle() }){
                            Spacer()
                            Image(systemName: isVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }.padding(.horizontal)
                       
                    }
                    Spacer()
                }

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


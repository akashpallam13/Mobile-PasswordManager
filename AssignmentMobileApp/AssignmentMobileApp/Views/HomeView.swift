//
//  HomeView.swift
//  AssignmentMobileApp
//
//  Created by Pallam Madhukar on 4/17/25.
//

import SwiftUI
import SwiftUI

struct HomeView : View {
        @StateObject private var viewModel = UserViewModel()
        @State  var showingAddUser = false
        @State  var selectedUser: User?
        @State  var alertMessage: String = ""
        @State  var showingAlert = false

        
    var body: some View {
        
        NavigationView {
            ZStack(alignment:.bottom){
                VStack(alignment:.trailing) {
                    if viewModel.users.isEmpty {
                        Text("No accounts yet. Tap + to add one.")
                            .foregroundColor(.gray)
                            .padding()
                    }
                    else{
                        Form{
                            List {
                                ForEach(viewModel.users) { user in
                                    VStack(alignment: .leading) {
                                        HStack{
                                            Text(user.AccountType)
                                            
                                                .font(.headline)
                                            
                                            Text(".........")
                                                .font(.subheadline)
                                        }
                                        .padding(20)                                }
                                    .onTapGesture {
                                        selectedUser = user
                                    }
                                }
                                .onDelete(perform: deleteUser)
                            }
                            .padding()
                        }
                    }
                    Button(action: {showingAddUser = true}) {
                        VStack(alignment:.trailing){
                            Image(systemName: "plus")
                                .padding()
                                .frame(width: 60,height: 60)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
                        }
                    }
                    .padding()
                    
                }
            }
            .navigationTitle("Password Manager")
        
                       
            .font(.system(size: 22))
            .sheet(item: $selectedUser) { user in
                UserDetailView(user: user, onDelete: {
                    viewModel.deleteUser(id: user.id)
                    selectedUser = nil
                    showAlert(message: "User deleted successfully")
                },onEdit: { updatedUser in
                    viewModel.updateUser(user: updatedUser)
                    selectedUser = nil
                    showAlert(message: "User updated successfully")
                }
                )
                .presentationDetents([.fraction(0.5)])
                    .presentationDragIndicator(.visible)
            }
            .onAppear {
                viewModel.loadUsers()
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Success"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .padding()
        
        .sheet(isPresented: $showingAddUser) {
            
            AddUserView { accountType, userName, password in
                guard !accountType.isEmpty, !userName.isEmpty, !password.isEmpty else {
                    showAlert(message: "All fields are required")
                    return
                }
                viewModel.addUser(accountType: accountType, userName: userName, password: password) {_ in
                    
                    showingAddUser = false
                    showAlert(message: "User added successfully")
                }
                
            }.presentationDetents([.fraction(0.5)])
                .presentationDragIndicator(.visible)
        }
        
    }
     func showAlert( message: String) {
        alertMessage = message
        showingAlert = true
    }
    func deleteUser(at offsets: IndexSet) {
            for index in offsets {
                let user = viewModel.users[index]
                viewModel.deleteUser(id: user.id)
            }
        }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserViewModel()) // Provide the UserViewModel for the preview
    }
}

#Preview {
    HomeView()
}

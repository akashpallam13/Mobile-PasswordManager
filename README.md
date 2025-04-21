# Mobile-PasswordManager
A lightweight and secure password manager built using **SwiftUI**, **SQLite**, and **CryptoKit**. The app lets you store, edit, and delete user credentials securely, with encryption and a smooth UI featuring half-sheet modals.

---

## ✨ Features

- 🔒 Store credentials securely (Account Type, Username, Password)
- 🛡 Password encryption using AES-GCM via CryptoKit
- 👁 Toggle password visibility
- 🧾 SQLite database using [SQLite.swift](https://github.com/stephencelis/SQLite.swift)
- 📱 Modern SwiftUI interface
- 🧩 Half sheet add user modal
- 🗑 Swipe-to-delete and tap-to-edit functionality

---

## 🛠 Setup

### Requirements
- Xcode 15+
- iOS 15+
- Swift Package Manager

(https://github.com/akashpallam13/Mobile-PasswordManager.git )
Open the .xcodeproj or .xcworkspace file in Xcode.

Add SQLite.swift via Swift Package Manager:

File → Add Packages → Search for https://github.com/stephencelis/SQLite.swift

Choose the latest version.

Build and run the app on a simulator or device.

Project Structure
User.swift – Model for user data

UserTable.swift – Handles all SQLite database operations

UserViewModel.swift – Business logic and state management

CryptoHelper.swift – Encrypts/decrypts passwords

HomeView.swift – Main UI to display accounts

AddUserView.swift – View to add new credentials


UserDetailView.swift – View for viewing/editing a selected user

HalfSheet.swift – Custom reusable half-sheet presentation
 Security
Passwords are encrypted using AES-GCM with a randomly generated symmetric key at runtime (non-persisted). This is ideal for learning purposes, but for production apps consider secure key management using the Keychain or Secure Enclave.
![Simulator Screenshot - iPhone 15 Pro - 2025-04-18 at 19 31 07](https://github.com/user-attachments/assets/fb9336cb-53d3-4191-86be-d441230972d3)
![Simulator Screenshot - iPhone 15 Pro - 2025-04-18 at 19 30 58](https://github.com/user-attachments/assets/1b26872f-f59b-43ea-9e04-1add5b4ba0d7)
![Simulator Screenshot - iPhone 15 Pro - 2025-04-18 at 19 30 50](https://github.com/user-attachments/assets/c157f668-fb49-44e6-8ae9-3c2804c34ba6)
![Simulator Screenshot - iPhone 15 Pro - 2025-04-18 at 19 30 45](https://github.com/user-attachments/assets/9e40be1b-61b7-4786-b80f-3b4c2d6a6dc5)
![Simulator Screenshot - iPhone 15 Pro - 2025-04-18 at 19 30 40](https://github.com/user-attachments/assets/aef0c35d-1add-4d43-ba9e-7bf683a6b826)


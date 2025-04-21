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

Home Screen | Add User | Password Toggle
![Simulator Screenshot - iPhone 15 P![Simulator Screenshot - iPhone 15 Pro - 2025-04-18 at 19 31 07]   (https://github.com/user-attachments/assets/f72b769c-f2cc-4e7d-9a9b-8611d127eb4f)
 ro - 2025-04-18 at 19 30 45](https://github.com/user-attachments/assets/e333487a-6237-42d4-b793-a0e5afe2bd76)![Simulator Screenshot - iPhone 15 Pro - 2025-04-18 at 19 30 58](https://github.com/user-attachments/assets/f4d4eea3-24eb-4041-bbaf-874f0af5fe74)

 ![Simulator Screenshot - iPhone 15 Pro - 2025-04-18 at 19 30 50](https://github.com/user-attachments/assets/ab3e486d-ada1-4740-9cd1-e9ddd188097c)

  ![Simulator Screenshot - iPhone 15 Pro - 2025-04-18 at 19 30 40](https://github.com/user-attachments/assets/aff6994c-9b04-4a72-adef-2406a654cc12)

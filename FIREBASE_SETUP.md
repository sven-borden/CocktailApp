# Firebase Setup Guide for Anonymous User Names

This guide will help you integrate Firebase into the CocktailApp to enable anonymous user name generation and storage.

## Overview

The app now generates fun anonymous usernames like `speedy_raccoon_123` or `mysterious_shaker_456` for each user. These names are stored in Firebase Firestore.

## Prerequisites

- Xcode 15+
- A Firebase account (free tier is sufficient)
- CocoaPods or Swift Package Manager

## Step 1: Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project" or select an existing project
3. Enter project name (e.g., "CocktailApp")
4. Follow the setup wizard (you can disable Google Analytics if not needed)

## Step 2: Register iOS App with Firebase

1. In Firebase Console, click the iOS icon to add an iOS app
2. Enter your iOS bundle ID: `com.sven-borden.CocktailApp` (or your actual bundle ID)
3. Enter App nickname: "CocktailApp" (optional)
4. Download the `GoogleService-Info.plist` file
5. **Important:** Add this file to your Xcode project:
   - Drag and drop into `CocktailApp/CocktailApp/` folder in Xcode
   - Make sure "Copy items if needed" is checked
   - Select your app target

## Step 3: Add Firebase SDK to Xcode Project

### Option A: Swift Package Manager (Recommended)

1. Open your Xcode project
2. Go to File → Add Package Dependencies...
3. Enter the Firebase iOS SDK URL: `https://github.com/firebase/firebase-ios-sdk`
4. Select version: 10.18.0 or later
5. Add the following packages:
   - **FirebaseCore** (required)
   - **FirebaseFirestore** (required)

### Option B: CocoaPods

1. Create a `Podfile` in your project root if you don't have one:
```ruby
platform :ios, '15.0'

target 'CocktailApp' do
  use_frameworks!

  # Firebase pods
  pod 'Firebase/Core'
  pod 'Firebase/Firestore'
end
```

2. Run in terminal:
```bash
cd /path/to/CocktailApp
pod install
```

3. Open `CocktailApp.xcworkspace` (not .xcodeproj) from now on

## Step 4: Set Up Firestore Database

1. In Firebase Console, go to "Firestore Database"
2. Click "Create database"
3. Choose **Start in test mode** (for development)
   - This allows read/write access for 30 days
   - You can update rules later for production
4. Select a location (choose one closest to your users)
5. Click "Enable"

## Step 5: Configure Firestore Security Rules (Optional but Recommended)

Once your database is created, update the security rules:

1. In Firebase Console → Firestore Database → Rules
2. Replace with these rules:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Allow all users to read and write their own user document
    match /users/{userId} {
      allow read: if true;  // Anyone can read user profiles (anonymous names are public)
      allow create: if true; // Anyone can create a new user
      allow update: if request.auth == null || request.resource.data.id == userId;
      allow delete: if request.auth == null; // Allow delete for anonymous users
    }
  }
}
```

3. Click "Publish"

## Step 6: Verify Installation

The code is already integrated! When you run the app:

1. On first launch, the app will:
   - Generate a unique anonymous name (e.g., `jolly_penguin_456`)
   - Save it to Firebase Firestore
   - Store the user ID locally in UserDefaults

2. On subsequent launches:
   - The app loads the existing user from Firebase
   - Updates the last active timestamp

## Step 7: Test the Implementation

1. Build and run the app in Xcode
2. Go to the "About" tab
3. You should see "Your Anonymous Profile" with a generated name
4. In Firebase Console → Firestore Database, you should see:
   - A `users` collection
   - A document with your user data including the display_name

## Viewing User Data in Firebase

Navigate to Firestore Database in Firebase Console to see:

```
users (collection)
  └── {user-id} (document)
      ├── id: "uuid-string"
      ├── display_name: "speedy_raccoon_123"
      ├── created_at: 1234567890.0
      └── last_active_at: 1234567890.0
```

## Troubleshooting

### "Module 'FirebaseCore' not found"
- Make sure you've added the Firebase packages via SPM or CocoaPods
- Clean build folder: Product → Clean Build Folder (Cmd+Shift+K)
- Rebuild the project

### "GoogleService-Info.plist not found"
- Verify the .plist file is in your project directory
- Check that it's added to the correct target in Xcode
- File should be visible in Project Navigator

### No data appearing in Firestore
- Check that `GoogleService-Info.plist` is correctly configured
- Verify Firebase.configure() is being called in `CocktailAppApp.swift`
- Check Xcode console for Firebase errors
- Ensure internet connectivity

### Testing on Simulator vs Device
- Anonymous users are tied to the device/simulator
- Each device/simulator will get its own unique name
- To test multiple users, use different simulators or devices

## Features Implemented

✅ **Anonymous User Model** - User.swift with Firebase serialization
✅ **Name Generation** - AnonymousNameGenerator with 14.4M unique combinations
✅ **Word Lists** - 120 adjectives + 120 nouns
✅ **Firebase Service** - UserService for CRUD operations
✅ **Automatic Initialization** - User created on first app launch
✅ **Profile Display** - Shows anonymous name in About view
✅ **Persistence** - User ID stored locally, data synced with Firebase

## Next Steps

- **Production Security Rules:** Update Firestore rules for production
- **User Preferences:** Store user favorites and preferences in Firebase
- **Analytics:** Track user engagement with Firebase Analytics
- **Testing:** Write unit tests for name generation and uniqueness

## File Structure

```
CocktailApp/
├── Models/
│   └── User.swift                    # User data model
├── Services/
│   ├── UserService.swift             # Firebase user management
│   └── AnonymousNameGenerator.swift  # Name generation logic
├── Utilities/
│   └── AnonymousNameLists.swift      # Word lists (120 adj + 120 nouns)
├── Views/
│   └── AboutView.swift               # Displays user profile
└── CocktailAppApp.swift              # Firebase initialization
```

## Support

For Firebase-specific issues:
- [Firebase iOS Documentation](https://firebase.google.com/docs/ios/setup)
- [Firestore Get Started](https://firebase.google.com/docs/firestore/quickstart)

For app-specific questions, contact the development team.

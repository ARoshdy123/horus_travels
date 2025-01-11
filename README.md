# Tourism App - README

## **Overview**
The Tourism App is a Flutter-based application designed to showcase popular places and landmarks categorized by governorates. It provides features like user authentication, viewing favorite places, and profile management, all while leveraging **SharedPreferences** for persistent data storage.

---

## **Features**

1. **Authentication**:
    - **Signup**: Users can create an account by entering their name, email, phone number, and password.
    - **Login**: Users can log in using their registered email and password.
    - **Logout**: Users can log out, clearing only the session state while retaining their saved data.

2. **Home Page**:
    - Displays popular places dynamically loaded from SharedPreferences.
    - Toggle between list and grid views.

3. **Governorates Page**:
    - Displays a list of governorates.
    - Navigates to a filtered list of places within the selected governorate.

4. **Favorites Page**:
    - Shows a list of user-selected favorite places.
    - Users can remove places from favorites.

5. **Profile Page**:
    - Displays user details like name, email, phone number, and password.
    - Users can edit their profile information.
    - Includes password visibility toggle.

---

## **Technology Stack**

- **Flutter**: UI framework for building the application.
- **SharedPreferences**: Local storage for persisting user data and app state.
- **Dart**: Programming language for Flutter.
- **Material Design**: Used for styling and UI components.

---

## **Project Structure**

```
lib/
├── authentication/
│   ├── screens/
│   │   ├── login_screen.dart
│   │   ├── signup_screen.dart
│   └── widgets/
│       ├── login_form.dart
│       ├── signup_form.dart
├── main_screen.dart
├── pages/
│   ├── home_page.dart
│   ├── governments_page.dart
│   ├── favorites_page.dart
│   ├── profile_page.dart
├── utils/
│   ├── shared_preferences_helper.dart
├── main.dart
```

---

## **Setup and Installation**

### Prerequisites
1. Flutter SDK installed on your system.
2. Dart enabled.
3. An IDE like Visual Studio Code or Android Studio.

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/tourism-app.git
   cd tourism-app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

---

## **SharedPreferences Data Structure**

### User Data
```json
{
  "firstName": "John",
  "lastName": "Doe",
  "email": "john.doe@example.com",
  "phone": "1234567890",
  "password": "password123",
  "isLoggedIn": true
}
```

### Places Data
```json
[
  {
    "name": "Pyramids of Giza",
    "description": "Iconic pyramids in Egypt",
    "governorate": "Cairo"
  },
  {
    "name": "Bibliotheca Alexandrina",
    "description": "A major library and cultural center",
    "governorate": "Alexandria"
  },
  {
    "name": "Karnak Temple",
    "description": "An ancient Egyptian temple complex",
    "governorate": "Luxor"
  }
]
```

---

## **Key Functions**

1. **Login Validation**:
    - Validate user credentials from SharedPreferences.

2. **Saving Favorites**:
    - Save and retrieve favorite places using JSON in SharedPreferences.

3. **Dynamic Filtering**:
    - Filter places based on the selected governorate.

4. **Persistent State**:
    - Use `isLoggedIn` flag in SharedPreferences to manage session state.

---

## **Future Enhancements**

1. Add a backend for remote data storage and synchronization.
2. Implement search and filtering features on the Home Page.
3. Enhance the UI/UX with animations and improved layouts.
4. Add multi-language support.

---

## **License**
This project is licensed under the MIT License. See the LICENSE file for more details.

---

## **Contributors**
- [Your Name](https://github.com/your-profile)

---

## **Acknowledgments**
- Thanks to the Flutter and Dart communities for their extensive documentation and support!


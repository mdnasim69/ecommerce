<div align="center">
https://via.placeholder.com/800x200/4A6572/FFFFFF?text=Crafty+Bay+-+Your+One-Stop+Shop <!-- You can add a real banner image later -->

https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white
https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white
https://img.shields.io/badge/GetX-8A2BE2?style=for-the-badge

![image alt](https://github.com/mdnasim69/ecommerce/blob/e233fc9623eb8eab651d506b1b0c495e6d847fcf/assets/images/Screenshot_2025-11-17-11-05-11-44_4cf85880cfe8ba4bfde5d76319ab5d2f.jpg)

A feature-rich Flutter e-commerce application built with modern development practices.

</div>
📱 About The Project
Crafty Bay is a full-fledged e-commerce mobile application that allows users to browse products, manage their cart, create wishlists, and complete their profile. The app features a clean, intuitive user interface and a scalable architecture.

The project demonstrates the implementation of core e-commerce features and state management using the GetX framework.

Screenshots
Login & OTP	Product Details & Categories	User Profile & Wishlist
<img src="screenshots/1000106931.jpg" width="200" />	<img src="screenshots/1000106923.jpg" width="200" />	<img src="screenshots/1000106928.jpg" width="200" />
Sign Up	Home Drawer	Wishlist
<img src="screenshots/1000106933.jpg" width="200" />	<img src="screenshots/1000106930.jpg" width="200" />	<img src="screenshots/1000106926.jpg" width="200" />
(Note: Replace screenshots/ with the actual paths to your images in your repo)

✨ Features
User Authentication

Email & Password Login

User Registration

OTP Verification

Product Browsing

Category-based Product Listing

Detailed Product View with Images, Reviews, and Descriptions

Color and Size Variants Selection

User Interactions

Add/Remove items from Cart

Add/Remove items from Wishlist

User Management

User Profile View and Update

Order History (Planned)

UI/UX

Responsive and Modern Design

Bottom Navigation Bar

Interactive Drawer Menu

🛠️ Tools & Technologies
Framework: Flutter

Language: Dart

State Management: GetX

Backend & APIs: REST API

Authentication: Firebase (Implied)

Tools: Android Studio, Postman

Version Control: Git & GitHub

🏗️ Project Structure
The project follows a feature-first, layered architecture for better scalability and separation of concerns.

text
ecommerce/
└── lib/
    ├── main.dart                  # Application entry point
    └── Features/                  # Feature-based modules
        └── Category/              # Example Feature: Category
            ├── UI/                # Contains all UI screens & widgets
            │   ├── screens/
            │   └── widgets/
            ├── controller/        # GetX Controller for business logic
            └── data/              # Data layer (models, repositories)
Key Architectural Points:

Features/: Each feature (e.g., Category, Product, Auth, Cart) is contained within its own directory.

UI/: Holds the views and presentation logic.

controller/: Manages the state and business logic for the feature using GetX.

data/: Handles data models, API calls, and local data sources.

🚀 Getting Started
Prerequisites
Flutter SDK

Android Studio / VS Code

An emulator or physical device

Installation
Clone the repository

bash
git clone https://github.com/mdnasim69/ecommerce.git
cd ecommerce
Get dependencies

bash
flutter pub get
Run the application

bash
flutter run
📂 API Integration & State Management
REST API: The app communicates with a backend server using RESTful APIs, integrated and tested via Postman.

GetX: Used for:

State Management: Reactive state management for UI updates.

Route Management: Simplifies navigation between screens.

Dependency Management: Easy and efficient dependency injection.

🔮 Future Enhancements
Integration with a live payment gateway.

Push notifications for order updates.

Advanced product search and filtering.

User review and rating system.

Dark Mode theme.

👨‍💻 Developer
Md Nasim Uddin

GitHub: @mdnasim69

Email: nasim@mail.com

"I'm a beginner in Flutter, and this project is a significant step in my learning journey. Feedback and contributions are welcome!"

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

<div align="center">
If you found this project helpful, don't forget to ⭐ star the repository!
</div>

# 🎨 Faym - Collection Gallery App

A modern, elegant Flutter application featuring an interactive collection gallery with expandable cards, image viewing, and smooth animations. Built with GetX state management and Material Design 3.

## ✨ Features

### 🗂️ Collection Cards
- **Expandable/Collapsible Design** - Tap any collection to expand and view images
- **Smart Image Preview** - Shows up to 5 images horizontally with smooth scrolling
- **Overflow Indicator** - Displays "+N more" card when collections have more images
- **Single Expansion** - Only one collection can be expanded at a time for focused viewing
- **Smooth Animations** - 300ms animated transitions for all interactions

### 🖼️ Image Gallery
- **Full-Screen Viewer** - Immersive image viewing experience with dark mode
- **Zoom & Pan** - Pinch to zoom (0.5x - 4x) and pan through images
- **Swipe Navigation** - Smooth horizontal swipe between images
- **Image Counter** - Shows current position (e.g., "3 / 10")
- **Loading States** - Beautiful gradient loading indicators
- **Error Handling** - Graceful fallback for failed image loads

### 🎨 Modern UI/UX
- **Material Design 3** - Latest design system with dynamic theming
- **Custom Color Palette** - Purple/pink gradient accent colors
- **Gradient Backgrounds** - Subtle gradients throughout the UI
- **Smooth Shadows** - Depth and elevation with custom shadow effects
- **Responsive Layout** - Optimized for various screen sizes
- **Empty States** - Friendly messages when no content is available

## 🛠️ Tech Stack

- **Framework**: Flutter 3.8.1+
- **Language**: Dart
- **State Management**: GetX 4.6.6
- **Architecture**: MVC Pattern
- **UI**: Material Design 3

## 📁 Project Structure

```
lib/
├── main.dart                          # App entry point
├── home/
│   ├── controllers/
│   │   └── collection_controller.dart # GetX controller for state
│   ├── models/
│   │   └── collection_model.dart      # Collection data model
│   ├── views/
│   │   ├── collections_view.dart      # Main collections screen
│   │   └── image_gallery_view.dart    # Full-screen image viewer
│   └── widgets/
│       ├── collection_card.dart       # Expandable collection card
│       ├── image_overlay_card.dart    # "+N more" overlay card
│       └── network_image_widget.dart  # Reusable image component
└── utils/
    └── constants/
        ├── app_colors.dart            # Color palette
        └── app_constants.dart         # App-wide constants
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.8.1 or higher
- Dart SDK 3.8.1 or higher
- Android Studio / VS Code with Flutter extensions
- iOS development setup (for iOS builds)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Naman2004singh/faym.git
   cd faym
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Building for Production

**Android APK**
```bash
flutter build apk --release
```

**iOS**
```bash
flutter build ios --release
```

**Web**
```bash
flutter build web --release
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.6              # State management & navigation
  cupertino_icons: ^1.0.8  # iOS-style icons

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0    # Linting rules
```

## 🎯 Key Features Implementation

### Accordion Behavior
- Only one collection expands at a time
- Smooth animated expansion/collapse
- Visual feedback with icon rotation
- Gradient header with accent bar

### Image Management
- Network image loading with caching
- Progressive loading indicators
- Error state handling
- Optimized image display

### State Management
- GetX reactive state management
- Centralized controller logic
- Efficient UI updates with Obx

## 🎨 Color Palette

| Color Name | Hex Code | Usage |
|------------|----------|-------|
| Primary | `#6C63FF` | Main accent, buttons |
| Primary Light | `#8B85FF` | Gradients, highlights |
| Secondary | `#FF6584` | Secondary actions |
| Accent | `#00D4AA` | Accent elements |
| Background | `#F8F9FE` | App background |
| Text Primary | `#2D3142` | Main text |
| Text Secondary | `#7E8A9E` | Subtitles, descriptions |

## 📱 Screenshots

<!-- Add your screenshots here -->
```
Main Screen
<img width="1080" height="2424" alt="Screenshot_1770444929" src="https://github.com/user-attachments/assets/7d72615b-b114-41e3-8b9a-43c42bba177c" />

Expanded View
<img width="1080" height="2424" alt="Screenshot_1770444938" src="https://github.com/user-attachments/assets/8b279ae1-932f-4556-adaf-88331e7138d2" />

Image Gallery
<img width="1080" height="2424" alt="Screenshot_1770444946" src="https://github.com/user-attachments/assets/395cb9c6-a5d7-4ab5-abe8-71bc6d63e732" />

```

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 Code Style

This project follows the official [Flutter style guide](https://flutter.dev/docs/development/tools/formatting) and uses `flutter_lints` for code analysis.

Run linting:
```bash
flutter analyze
```

Format code:
```bash
flutter format lib/
```

## 🐛 Known Issues

- None currently reported

## 🔜 Future Enhancements

- [ ] Add local image support
- [ ] Implement search functionality
- [ ] Add filter/sort options
- [ ] Enable collection editing
- [ ] Add share functionality
- [ ] Implement favorites feature
- [ ] Add dark mode toggle
- [ ] Support offline mode

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Naman Singh**

- GitHub: [@Naman2004singh](https://github.com/Naman2004singh)
- Email: naman.2singh9@gmail.com.com

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- GetX community for excellent state management
- Material Design team for design guidelines
- Unsplash/Picsum for placeholder images

## 📞 Support

If you like this project, please give it a ⭐️ on GitHub!

For issues and feature requests, please use the [Issues](https://github.com/Naman2004singh/faym/issues) section.

---

Made with ❤️ using Flutter

# CocktailApp

A native iOS cocktail catalog application built with SwiftUI, featuring a beautiful interface to browse, favorite, and explore cocktail recipes.

![iOS](https://img.shields.io/badge/iOS-18.0+-blue.svg)
![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-3.0+-green.svg)

## Features

### 🍹 Browse Cocktails
- Responsive 2-column grid layout
- Beautiful cocktail images with descriptions
- Alcohol percentage and category tags
- Quick favorite toggle on each card

### ⭐ Featured Carousel
- Auto-rotating carousel showcasing favorited cocktails
- 10-second auto-play with smooth transitions
- Tap to view full details

### 📖 Detailed Recipes
- Full-screen image carousel with multiple photos
- Complete ingredient lists with quantities
- Comprehensive cocktail descriptions
- Favorite toggle synced across all views

### 💾 Data Persistence
- Smart local storage using JSON files
- Favorite preferences persist across app launches
- Merge logic for future online/offline sync capability

### ℹ️ About Page
- App information and description
- Team member profiles

## Screenshots

*Screenshots showing Home Screen, Detail View, and About Page*

## Architecture

### MVVM Pattern
```
CocktailApp/
├── Models/              # Data models (Codable)
│   ├── Cocktail.swift
│   └── Ingredient.swift
├── ViewModels/          # Business logic & state management
│   └── CocktailListViewModel.swift
├── Views/               # SwiftUI views
│   ├── CocktailListView.swift
│   ├── CocktailDetailView.swift
│   ├── AboutView.swift
│   └── Components/
│       ├── CocktailGridItem.swift
│       └── FeaturedCarousel.swift
├── Services/            # Data layer
│   ├── CocktailService.swift
│   └── StorageService.swift
└── Utilities/           # Helpers & extensions
    ├── ColorExtension.swift
    └── Constants.swift
```

### Tech Stack
- **Framework**: SwiftUI
- **Architecture**: MVVM (Model-View-ViewModel)
- **State Management**: `@Published` properties with Combine
- **Data Persistence**: FileManager + Codable (JSON)
- **Image Loading**: AsyncImage with placeholder support
- **Minimum iOS**: 18.0+

## Design System

### Color Palette
- **Primary**: `#AD103A` (Burgundy/Wine Red)
- **Secondary**: `#d54381`
- **Accents**: Green, Red, Orange, Blue
- **Grayscale**: 9-tier system (Gray 100-900)

### Typography
- **Font**: Montserrat (Bold, SemiBold, Medium, Regular)
- **Sizes**: 12pt - 24pt scale

## Getting Started

### Prerequisites
- Xcode 15.0+
- iOS 18.0+ Simulator or Device
- macOS 14.0+

### Installation

1. Clone the repository:
```bash
git clone https://github.com/sven-borden/CocktailApp.git
cd CocktailApp
```

2. Open the Xcode project:
```bash
open CocktailApp/CocktailApp.xcodeproj
```

3. Select your target simulator (iPhone 17 Pro Max recommended)

4. Build and run (⌘ + R)

## Adding More Cocktails

The app currently uses hardcoded JSON data for development. To add more cocktails:

1. Open `CocktailApp/Services/CocktailService.swift`
2. Add cocktail objects to the `dummyJSONString` array following this structure:

```json
{
  "ID": 3,
  "ImagePath": "https://images.unsplash.com/photo-xxx",
  "PreviewImages": [
    "https://images.unsplash.com/photo-xxx",
    "https://images.unsplash.com/photo-yyy"
  ],
  "Name": "Cocktail Name",
  "Description": "Detailed description...",
  "OverallRating": 4.5,
  "TotalReviews": "100",
  "Alcohol": 0.20,
  "Tag": "Category",
  "Recipe": [
    {
      "ID": 1,
      "Name": "Ingredient Name",
      "Quantity": 50
    }
  ],
  "Version": 1.0,
  "IsFavourite": false,
  "DominantColor": "#hexcode"
}
```

## Project Structure

### Data Models
- **Cocktail**: Main model with all cocktail information
- **Ingredient**: Recipe component with name and quantity

### ViewModels
- **CocktailListViewModel**: Manages cocktail list state, favorites, and data loading

### Services
- **CocktailService**: Provides cocktail data (currently hardcoded)
- **StorageService**: Handles local JSON persistence and data merging

### Views
- **CocktailListView**: Home screen with grid and carousel
- **CocktailDetailView**: Full cocktail details and recipe
- **AboutView**: App information and team
- **Components**: Reusable UI components

## Features Roadmap

### Future Enhancements
- [ ] Online API integration (replacing hardcoded data)
- [ ] Search functionality
- [ ] Filter by alcohol content, category, or favorites
- [ ] Share cocktail recipes
- [ ] Pull-to-refresh
- [ ] Dark mode support
- [ ] iPad optimization
- [ ] Accessibility improvements (VoiceOver, Dynamic Type)
- [ ] Shopping list feature
- [ ] Custom cocktail creation

## Testing

### Device Requirements

For optimal testing and development, you should test on:
- **Real Device** (recommended for production testing), OR
- **iPhone 17 Pro Max Simulator** running **iOS 26.1**

### Test Coverage

The app has been tested on:
- ✅ iPhone 17 Pro Max (iOS 26.1 Simulator)
- ✅ Portrait orientation
- ✅ All navigation flows
- ✅ Data persistence
- ✅ Favorite synchronization

## Documentation

For detailed feature specifications and implementation details, see [COCKTAIL_APP_DOCUMENTATION.md](COCKTAIL_APP_DOCUMENTATION.md)

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Built with SwiftUI and modern iOS development practices
- Cocktail images from Unsplash
- Design inspired by the original Xamarin.Forms implementation

---

🤖 README generated with [Claude Code](https://claude.com/claude-code)

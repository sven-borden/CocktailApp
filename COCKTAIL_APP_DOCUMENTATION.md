# CocktailApp - Complete Feature Documentation

## Executive Summary

This document provides comprehensive documentation of the existing CocktailApp implementation to facilitate the development of a native Swift iOS application. The current app is built using Xamarin.Forms (C#) and targets both iOS and Android platforms.

---

## 1. Technology Stack

### Current Implementation
- **Framework**: Xamarin.Forms (Cross-platform)
- **Language**: C# (.NET)
- **UI Framework**: XAML for declarative UI
- **Third-party Libraries**:
  - Syncfusion UI Controls (SfRotator, SfListView, SfButton, SfBorder, etc.)
  - Newtonsoft.Json for JSON serialization
  - Microsoft AppCenter for crash analytics

### Target Implementation
- **Framework**: Native Swift/SwiftUI
- **Language**: Swift
- **UI Framework**: SwiftUI
- **Minimum iOS Version**: TBD (recommend iOS 15+)

---

## 2. Data Architecture

### 2.1 Data Models

#### Cocktail Model
```csharp
public class Cocktail
{
    public int ID { get; set; }
    public string ImagePath { get; set; }
    public List<string> PreviewImages { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public double OverallRating { get; set; }
    public string TotalReviews { get; set; }
    public double Alcohol { get; set; }
    public string Tag { get; set; }
    public List<Ingredient> Recipe { get; set; }
    public double Version { get; set; }
    public bool IsFavourite { get; set; }
    public string DominantColor { get; set; }
}
```

**Swift Equivalent**:
```swift
struct Cocktail: Identifiable, Codable {
    let id: Int
    let imagePath: String
    let previewImages: [String]
    let name: String
    let description: String
    let overallRating: Double
    let totalReviews: String
    let alcohol: Double
    let tag: String
    let recipe: [Ingredient]
    let version: Double
    var isFavourite: Bool
    let dominantColor: String?
}
```

#### Ingredient Model
```csharp
public class Ingredient
{
    public int ID { get; set; }
    public string Name { get; set; }
    public double Quantity { get; set; }
}
```

**Swift Equivalent**:
```swift
struct Ingredient: Identifiable, Codable {
    let id: Int
    let name: String
    let quantity: Double
}
```

#### AboutUs Model
```csharp
public class AboutUsModel
{
    public string EmployeeName { get; set; }
    public string Image { get; set; }
    public string Designation { get; set; }
}
```

### 2.2 Data Source

**API Endpoint**: `https://borden.ch/cocktails.json`

**Data Flow**:
1. On app launch, load data from local storage (if available)
2. Fetch latest data from online API
3. Merge local and online data using smart merge logic
4. Save merged data to local storage
5. Persist user preferences (favorites) across sessions

**Merge Logic** (from `StorageHelper.cs:66-88`):
- If cocktail exists only online: Add it to the list
- If cocktail exists only locally: Remove it (data cleanup)
- If cocktail exists in both:
  - Preserve user's `isFavourite` preference from local data
  - Update cocktail data if online version is newer (compare `version` field)
  - Keep local version if it's the same or newer

**Local Storage**:
- File: `cocktail.txt` (JSON format)
- Location: Application's LocalApplicationData folder
- Format: JSON array of Cocktail objects

---

## 3. Application Architecture

### 3.1 Navigation Structure

```
ArticleTilePage (Home/Main)
    ├── CocktailBookingPage (Detail View)
    └── AboutUsWithCardsPage (Settings/About)
```

### 3.2 View Hierarchy

#### 1. ArticleTilePage (Main Screen)
**File**: `OLD/CocktailApp/Views/Catalog/ArticleTilePage.xaml`

**Components**:
- **TitleView**: App title "Cocktails"
- **Settings Button**: Gear icon (top-left) → navigates to About Us page
- **Featured Carousel**: Auto-rotating carousel showing favorited cocktails
- **Latest Cocktails Grid**: Grid view of all cocktails

**ViewModel**: `ArticleListViewModel`

#### 2. CocktailBookingPage (Detail Screen)
**File**: `OLD/CocktailApp/Views/CocktailDetail/CocktailBookingPage.xaml`

**Components**:
- **Image Carousel**: Swipeable full-width image gallery
- **Dots Indicator**: Shows current image position
- **Cocktail Name**: Large title
- **Favorite Button**: Toggle favorite status
- **Alcohol Percentage**: Prominently displayed
- **"Get" Button**: Placeholder for future functionality
- **Cocktail Information**: Description section
- **Ingredients List**: Recipe with quantities (BookingFeedbackView)

**ViewModel**: `CocktailBookingPageViewModel`

#### 3. AboutUsWithCardsPage (Settings/About)
**File**: `OLD/CocktailApp/Views/AboutUs/AboutUsWithCardsPage.xaml`

**Components**:
- **Hero Image**: Top banner image
- **About Us Card**: App description with shadow
- **Team Section**: Grid of team member cards

**ViewModel**: `AboutUsViewModel`

---

## 4. Feature Specifications

### 4.1 Home Screen (ArticleTilePage)

#### Featured Cocktails Carousel
- **Location**: Top of screen, below title
- **Behavior**:
  - Auto-play enabled with 10-second delay
  - Infinite looping
  - Shows only cocktails marked as favorite
  - Tap to navigate to detail view
- **Display**:
  - Full-width image (aspect fill)
  - Overlay with cocktail name (white text, semi-transparent primary color background)
  - Dot navigation indicators (primary color for selected, white for others)
  - Height: 210px (phone), 450px (tablet/desktop)

#### Latest Cocktails Grid
- **Layout**:
  - Portrait: 2 columns (phone), 3 (tablet), 5 (desktop)
  - Landscape: 3 columns (phone), 4 (desktop)
- **Each Tile Contains**:
  - Cocktail image (120px height, aspect fill)
  - Name (semibold, 14pt, max 2 lines with ellipsis)
  - Description (medium, 12pt, max 2 lines with ellipsis)
  - Alcohol percentage | Tag (e.g., "25% | Summer")
  - Favorite toggle button (heart icon)
- **Interactions**:
  - Tap anywhere on tile → navigate to detail view
  - Tap favorite button → toggle favorite status (updates immediately)

#### Header
- Title: "Cocktails"
- Settings gear icon button (top-left corner)

### 4.2 Detail Screen (CocktailBookingPage)

#### Image Gallery
- **Carousel View**:
  - Full-width, 350px height
  - Swipe left/right to browse preview images
  - Aspect fill
- **Dot Indicator**:
  - Overlaid at bottom of images
  - Semi-transparent background
  - Updates as user swipes

#### Content Card
- **Shadow Frame**: Rounded corners (12px), elevated shadow
- **Components**:
  1. **Header Section**:
     - Cocktail name (semibold, 20pt)
     - Favorite button (circular, 40px, bordered, top-right)

  2. **Alcohol Display**:
     - Large percentage (24pt, primary color)
     - " alcohol" text (20pt, gray)
     - "Get" button (rounded, 35px height, primary style, right-aligned)

  3. **Information Section**:
     - "Cocktail Information" heading (semibold)
     - Description text (medium, 12pt, with margins)

  4. **Ingredients Section**:
     - "Cocktail Ingredients" heading (semibold, 16pt)
     - Two-column grid:
       - Left column: Ingredient name
       - Right column: Quantity
     - Rows for each ingredient

### 4.3 About/Settings Screen (AboutUsWithCardsPage)

#### Layout
- **Hero Image**: 253px height, full-width banner
- **About Us Card**:
  - White card with shadow
  - Offset upward to overlap hero image (-40px margin)
  - Contains: "About Us" heading + description text
- **Our Team Section**:
  - Grid layout: 2 columns (phone portrait), 4 (phone landscape), 5 (desktop)
  - Each team member card (160x160px):
    - Circular profile image (64px diameter)
    - Employee name (semibold)
    - Designation/title

**Content**:
- **Description**: "This application is dedicated to show the many possibilities of drinks at home. Welcome to Borden Cocktails and enjoy a nice evening with friends and drinks."
- **Team**: Sven Borden - Project Manager

### 4.4 Favorites System

**Functionality**:
- Users can mark/unmark cocktails as favorites
- Favorites persist across app sessions
- Featured carousel shows only favorited cocktails
- Favorite status syncs between list view and detail view

**Implementation Details**:
- Toggle action updates in-memory list
- Saves to local storage immediately
- Updates featured carousel automatically
- Visual feedback: Heart icon changes color
  - Unfavorited: Gray outline heart (icon: \ue701)
  - Favorited: Filled primary color heart (icon: \ue732)

---

## 5. Design System

### 5.1 Color Palette

```swift
// Primary Colors
let primaryColor = Color(hex: "#AD103A")        // Main brand color (burgundy/wine red)
let primaryDark = Color(hex: "#d0424f")
let primaryDarken = Color(hex: "#ab3641")
let primaryLighter = Color(hex: "#edcacd")
let primaryLight = Color(hex: "#ffe8f4")

// Secondary Colors
let secondary = Color(hex: "#d54381")

// Accent Colors
let green = Color(hex: "#7ed321")
let red = Color(hex: "#ff4a4a")
let orange = Color(hex: "#ff844a")
let blue = Color(hex: "#4acaff")
let hyperlink = Color(hex: "#567cd7")

// Grayscale
let gray100 = Color(hex: "#f6f7f8")
let gray200 = Color(hex: "#ebecef")
let gray300 = Color(hex: "#ced2d9")
let gray400 = Color(hex: "#b2b8c2")
let gray500 = Color(hex: "#959eac")
let gray600 = Color(hex: "#788396")
let gray700 = Color(hex: "#606a7b")
let gray800 = Color(hex: "#4a515e")
let gray900 = Color(hex: "#333942")
```

### 5.2 Typography

**Font Family**: Montserrat

**Weights Used**:
- **Bold**: Titles, headings
- **SemiBold**: Subtitles, important labels
- **Medium**: Body text, descriptions
- **Regular**: Secondary text

**Size Scale**:
- 24pt: Large display (alcohol percentage)
- 20pt: Page titles, headers
- 16pt: Section headings
- 14pt: Card titles, prominent labels
- 12pt: Body text, descriptions, metadata

### 5.3 Navigation Bar

**Style**:
- Background Color: `#AD103A` (primary color)
- Text Color: White
- Title: Shown on detail and about pages
- Back button: Default iOS style with white tint

### 5.4 UI Components

#### Buttons
- **Primary Button ("Get" button)**:
  - Background: Primary color
  - Corner radius: 24px (pill shape)
  - Text: White
  - Height: 35px

- **Icon Buttons (Favorite)**:
  - Circular (20px corner radius for 40px button)
  - Border: 1px, gray-300
  - Background: White
  - Icon: Font icon, 16pt

#### Cards
- **Shadow Frames**:
  - Corner radius: 4-12px
  - Background: White
  - Border: 1-2px, gray-200
  - Shadow: Subtle elevation
  - Padding: Varies by context

#### Images
- **Aspect Ratio**: AspectFill (maintains aspect, crops overflow)
- **Placeholder**: Gray-200 background while loading
- **Caching**: Enabled with 50-day cache validity
- **Border Radius**: Varies (0 for cards, 32px for circular avatars)

---

## 6. User Interactions & Workflows

### 6.1 App Launch Flow
```
1. App launches → ArticleTilePage
2. Load local data (if exists)
3. Display local data immediately
4. Fetch online data in background
5. Merge and update UI
6. Save merged data locally
```

### 6.2 Browse Cocktails Flow
```
1. User scrolls through grid
2. Featured carousel auto-rotates every 10 seconds
3. User can tap any cocktail tile or featured item
4. Navigate to CocktailBookingPage with selected cocktail
5. View details, swipe through images
6. Navigate back → Featured list refreshes with updated favorites
```

### 6.3 Favorite Management Flow
```
1. User taps heart icon on tile OR detail page
2. Icon immediately updates visual state
3. Cocktail isFavourite property toggles
4. Data saves to local storage
5. Featured carousel updates (adds/removes cocktail)
6. State persists across app sessions
```

### 6.4 Settings/About Flow
```
1. User taps gear icon on home screen
2. Navigate to AboutUsWithCardsPage
3. View app description and team
4. Navigate back to home
```

---

## 7. Technical Implementation Details

### 7.1 Data Loading Strategy

**Initial Load** (from `ArticleListViewModel.cs:158-170`):
```csharp
private async void LoadLocalData()
{
    await StorageHelper.GetCocktails(true);
    this.FeaturedStories = new ObservableCollection<Cocktail>(
        StorageHelper.CocktailsList.Where(c => c.IsFavourite == true)
    );
    this.LatestStories = new ObservableCollection<Cocktail>(
        StorageHelper.CocktailsList
    );
}
```

**Online Sync** (from `ArticleListViewModel.cs:144-157`):
```csharp
private async void LoadOnlineData()
{
    await StorageHelper.GetCocktails(false);
    this.FeaturedStories = new ObservableCollection<Cocktail>(
        StorageHelper.CocktailsList.Where(c => c.IsFavourite == true)
    );
    this.LatestStories = new ObservableCollection<Cocktail>(
        StorageHelper.CocktailsList
    );
}
```

### 7.2 State Management

**Favorite Toggle** (from `ArticleListViewModel.cs:186-194`):
```csharp
private void FavoriteButtonClicked(object obj)
{
    if (obj is Cocktail cocktail)
    {
        cocktail.IsFavourite = !cocktail.IsFavourite;
    }
    StorageHelper.SaveCocktails(StorageHelper.CocktailsList.ToList());
    this.FeaturedStories = new ObservableCollection<Cocktail>(
        StorageHelper.CocktailsList.Where(c => c.IsFavourite == true)
    );
}
```

### 7.3 Navigation

**To Detail** (from `ArticleListViewModel.cs:200-204`):
```csharp
private async void FeatureStoriesClicked(object obj)
{
    Cocktail SelectedCocktail = (obj as Cocktail);
    await Navigation.PushAsync(new CocktailBookingPage(SelectedCocktail));
}
```

**To About** (from `ArticleTilePage.xaml.cs:76-79`):
```csharp
private async void SettingsClicked(object sender, System.EventArgs e)
{
    await Navigation.PushAsync(new AboutUs.AboutUsWithCardsPage());
}
```

### 7.4 Responsive Layout

**Grid Columns** (from `ArticleTilePage.xaml.cs:55-68`):
```csharp
if (width > height) // Landscape
{
    GridLayout.SpanCount = Device.Idiom == TargetIdiom.Phone ? 3 : 4;
}
else // Portrait
{
    GridLayout.SpanCount =
        Device.Idiom == TargetIdiom.Phone ? 2 :
        Device.Idiom == TargetIdiom.Tablet ? 3 : 4;
}
```

---

## 8. SwiftUI Implementation Recommendations

### 8.1 Project Structure
```
CocktailApp/
├── Models/
│   ├── Cocktail.swift
│   ├── Ingredient.swift
│   └── AboutUsModel.swift
├── ViewModels/
│   ├── CocktailListViewModel.swift
│   ├── CocktailDetailViewModel.swift
│   └── AboutViewModel.swift
├── Views/
│   ├── CocktailListView.swift
│   ├── CocktailDetailView.swift
│   ├── AboutView.swift
│   └── Components/
│       ├── CocktailGridItem.swift
│       ├── FeaturedCarousel.swift
│       └── IngredientRow.swift
├── Services/
│   ├── CocktailService.swift
│   └── StorageService.swift
├── Utilities/
│   ├── ColorExtension.swift
│   └── Constants.swift
└── Resources/
    └── Assets.xcassets
```

### 8.2 Key SwiftUI Concepts to Use

**For Carousel**:
- `TabView` with `.tabViewStyle(.page)`
- `.indexViewStyle(.page(backgroundDisplayMode: .always))`

**For Grid**:
- `LazyVGrid` with `GridItem(.adaptive(minimum: 160))`

**For Image Loading**:
- `AsyncImage` with placeholder
- Consider SDWebImageSwiftUI for caching

**For Navigation**:
- `NavigationStack` (iOS 16+) or `NavigationView`
- `NavigationLink` for detail navigation

**For Data Persistence**:
- `@AppStorage` for simple favorites
- Or `UserDefaults` + `Codable`
- Or Core Data for more complex scenarios

**For Network Calls**:
- `URLSession` with `async/await`
- `JSONDecoder` for parsing

### 8.3 State Management Pattern

```swift
@MainActor
class CocktailListViewModel: ObservableObject {
    @Published var cocktails: [Cocktail] = []
    @Published var featuredCocktails: [Cocktail] = []

    private let service = CocktailService()

    func loadCocktails() async {
        // Load local
        if let local = loadLocalCocktails() {
            self.cocktails = local
            updateFeatured()
        }

        // Fetch online
        do {
            let online = try await service.fetchCocktails()
            let merged = mergeCocktails(local: cocktails, online: online)
            self.cocktails = merged
            updateFeatured()
            saveLocalCocktails(merged)
        } catch {
            print("Error fetching: \(error)")
        }
    }

    func toggleFavorite(_ cocktail: Cocktail) {
        if let index = cocktails.firstIndex(where: { $0.id == cocktail.id }) {
            cocktails[index].isFavourite.toggle()
            updateFeatured()
            saveLocalCocktails(cocktails)
        }
    }

    private func updateFeatured() {
        featuredCocktails = cocktails.filter { $0.isFavourite }
    }
}
```

### 8.4 Important SwiftUI Differences

1. **No Syncfusion Controls**: Replace with native SwiftUI components
   - `SfRotator` → `TabView` with `.page` style
   - `SfListView` → `LazyVGrid` or `List`
   - `SfButton` → `Button` with custom styling
   - `SfBorder` → `.overlay`, `.background`, `.cornerRadius`

2. **Fonts**:
   - Add Montserrat fonts to project
   - Use `.font(.custom("Montserrat-SemiBold", size: 14))`

3. **Icons**:
   - Use SF Symbols for icons (`heart`, `heart.fill`, `gearshape`)
   - Or include custom font icons

4. **Navigation Bar**:
   - Use `.navigationBarTitleDisplayMode(.inline)`
   - `.toolbarBackground(.visible, for: .navigationBar)`
   - `.toolbarColorScheme(.dark, for: .navigationBar)`

---

## 9. API Specifications

### 9.1 Endpoint

**URL**: `https://borden.ch/cocktails.json`

**Method**: GET

**Response Format**: JSON array

**Example Response**:
```json
[
  {
    "ID": 1,
    "ImagePath": "https://example.com/image.jpg",
    "PreviewImages": [
      "https://example.com/preview1.jpg",
      "https://example.com/preview2.jpg"
    ],
    "Name": "Mojito",
    "Description": "A refreshing Cuban cocktail",
    "OverallRating": 4.5,
    "TotalReviews": "128",
    "Alcohol": 0.15,
    "Tag": "Summer",
    "Recipe": [
      {
        "ID": 1,
        "Name": "White Rum",
        "Quantity": 50
      },
      {
        "ID": 2,
        "Name": "Lime Juice",
        "Quantity": 25
      }
    ],
    "Version": 1.2,
    "IsFavourite": false,
    "DominantColor": "#c5e8d5"
  }
]
```

### 9.2 Expected Field Types

- `ID`: Integer
- `ImagePath`: String (URL)
- `PreviewImages`: Array of Strings (URLs)
- `Name`: String
- `Description`: String
- `OverallRating`: Double (0-5 range expected)
- `TotalReviews`: String (formatted number)
- `Alcohol`: Double (0-1 range, represents percentage as decimal)
- `Tag`: String
- `Recipe`: Array of Ingredient objects
- `Version`: Double (for versioning/conflict resolution)
- `IsFavourite`: Boolean (client-side only, not from server)
- `DominantColor`: String (hex color, optional)

---

## 10. Edge Cases & Error Handling

### 10.1 Network Failures
- **Current Behavior**: Falls back to local data, shows what's available
- **Recommendation**: Add pull-to-refresh, show error message with retry option

### 10.2 Empty States
- **No Cocktails**: Should show empty state message
- **No Favorites**: Featured carousel should hide or show "No favorites yet" message

### 10.3 Image Loading
- **Current Behavior**: Shows gray placeholder while loading
- **Recommendation**: Add loading indicator, handle failed image loads gracefully

### 10.4 Data Merge Conflicts
- **Current Logic**: Online version wins if version number is higher
- **User Data Preserved**: Favorite status always preserved from local

---

## 11. Future Enhancements (Noted in Code)

### 11.1 "Get" Button
- Currently placeholder (`BookClicked` does nothing)
- Could be used for: sharing, adding to shopping list, tutorial, etc.

### 11.2 Rating & Reviews
- Models include `OverallRating` and `TotalReviews`
- UI has placeholder for review display (commented out in BookingFeedbackView)
- Could implement star rating display and review list

### 11.3 Menu Button
- Currently placeholder (`MenuClicked` does nothing)
- Could add: filters, sorting, search, user profile, etc.

---

## 12. Assets Required

### 12.1 Fonts
- Montserrat-Bold.ttf
- Montserrat-SemiBold.ttf
- Montserrat-Medium.ttf
- Montserrat-Regular.ttf

### 12.2 Icons
- App Icon (various sizes for iOS)
- Gear icon for settings (can use SF Symbol: `gearshape.fill`)
- Heart icons for favorites (can use SF Symbols: `heart`, `heart.fill`)

### 12.3 Images
- Logo.png (for About page)
- Default/placeholder cocktail image (optional)
- Hero image for About page

---

## 13. Testing Checklist

### 13.1 Core Functionality
- [ ] App launches and loads cocktails
- [ ] Featured carousel displays favorite cocktails
- [ ] Grid displays all cocktails correctly
- [ ] Tapping cocktail opens detail view
- [ ] Detail view shows all information correctly
- [ ] Image carousel works on detail page
- [ ] Favorite toggle works on list view
- [ ] Favorite toggle works on detail view
- [ ] Favorites persist after app restart
- [ ] Settings button navigates to About page
- [ ] About page displays correctly
- [ ] Back navigation works on all screens

### 13.2 Data Synchronization
- [ ] Local data loads on first launch
- [ ] Online data fetches in background
- [ ] Data merges correctly
- [ ] Favorites persist during merge
- [ ] Newer versions update correctly

### 13.3 UI/UX
- [ ] Images load and display correctly
- [ ] Layout adapts to different screen sizes
- [ ] Carousel auto-rotates (10 seconds)
- [ ] Grid columns adjust based on orientation
- [ ] Text truncates properly with ellipsis
- [ ] Colors match design system
- [ ] Fonts render correctly
- [ ] Shadows and borders display as expected

### 13.4 Edge Cases
- [ ] App works offline (with cached data)
- [ ] App handles network errors gracefully
- [ ] Empty states display correctly
- [ ] Image loading failures handled
- [ ] Large number of cocktails performs well
- [ ] No favorites scenario handled
- [ ] Rapid favorite toggling works correctly

---

## 14. Launch Readiness

### 14.1 Minimum Viable Product (MVP)
To match current app functionality, the Swift app must include:

1. ✅ Cocktail list with grid layout
2. ✅ Featured carousel for favorites
3. ✅ Cocktail detail view with image gallery
4. ✅ Ingredients list with quantities
5. ✅ Favorite toggle functionality
6. ✅ Data persistence (local storage)
7. ✅ Online data synchronization
8. ✅ About/Settings page
9. ✅ Responsive layout for different screen sizes
10. ✅ Color scheme and typography matching design

### 14.2 Nice-to-Have Enhancements
- Pull-to-refresh on cocktail list
- Search functionality
- Filter by tag/alcohol content
- Share cocktail feature
- Animation transitions
- Haptic feedback on favorite toggle
- Dark mode support
- iPad optimization with larger grid
- Accessibility support (VoiceOver, Dynamic Type)

---

## 15. Summary

The CocktailApp is a straightforward cocktail catalog application with three main screens:

1. **Home**: Grid of cocktails with featured carousel
2. **Detail**: Full cocktail information with image gallery and recipe
3. **About**: App information and team

**Core Features**:
- Browse cocktail catalog
- View detailed recipes
- Favorite/unfavorite cocktails
- Sync with online database
- Offline capability

**Key Technical Aspects**:
- REST API integration with local caching
- Smart data merge logic
- Image loading and caching
- Responsive grid layouts
- State persistence

This documentation provides all the information needed to recreate the app in native Swift/SwiftUI while maintaining feature parity with the existing Xamarin.Forms implementation.

---

## Appendix A: File Reference Map

### Models
- `OLD/CocktailApp/Models/Cocktail.cs` - Main cocktail data model
- `OLD/CocktailApp/Models/Ingredient.cs` - Recipe ingredient model
- `OLD/CocktailApp/Models/AboutUs/AboutUsModel.cs` - Team member model

### ViewModels
- `OLD/CocktailApp/ViewModels/Catalog/ArticleListViewModel.cs` - Home screen logic
- `OLD/CocktailApp/ViewModels/CocktailDetail/CocktailBookingPageViewModel.cs` - Detail screen logic
- `OLD/CocktailApp/ViewModels/AboutUs/AboutUsViewModel.cs` - About screen logic

### Views
- `OLD/CocktailApp/Views/Catalog/ArticleTilePage.xaml` - Home screen UI
- `OLD/CocktailApp/Views/CocktailDetail/CocktailBookingPage.xaml` - Detail screen UI
- `OLD/CocktailApp/Views/CocktailDetail/BookingFeedbackView.xaml` - Ingredients list UI
- `OLD/CocktailApp/Views/AboutUs/AboutUsWithCardsPage.xaml` - About screen UI
- `OLD/CocktailApp/Views/Templates/ArticleTileTemplate.xaml` - Cocktail grid item UI

### Services
- `OLD/CocktailApp/Helpers/StorageHelper.cs` - Data loading, saving, and merging

### Styling
- `OLD/CocktailApp/Themes/LightTheme.xaml` - Color palette and fonts
- `OLD/CocktailApp/App.xaml` - Global app resources and navigation bar styling

### Entry Point
- `OLD/CocktailApp/App.xaml.cs` - App initialization and main page setup

---

**Document Version**: 1.0
**Created**: 2025-11-13
**Purpose**: Swift iOS Native App Development Reference

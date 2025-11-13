//
//  CocktailService.swift
//  CocktailApp
//

import Foundation

class CocktailService {
    // Comprehensive cocktail database with 37 classic and contemporary cocktails
    private let dummyJSONString = """
    [
      {
        "ID": 1,
        "ImagePath": "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400",
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400"
        ],
        "Name": "Mojito",
        "Description": "A refreshing Cuban cocktail made with white rum, sugar, lime juice, soda water, and mint. Perfect for summer evenings.",
        "OverallRating": 4.5,
        "TotalReviews": "128",
        "Alcohol": 0.15,
        "Tag": "Contemporary",
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
          },
          {
            "ID": 3,
            "Name": "Sugar",
            "Quantity": 10
          },
          {
            "ID": 4,
            "Name": "Soda Water",
            "Quantity": 100
          },
          {
            "ID": 5,
            "Name": "Fresh Mint",
            "Quantity": 5
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#c5e8d5"
      },
      {
        "ID": 2,
        "ImagePath": "https://images.unsplash.com/photo-1536935338788-846bb9981813?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1536935338788-846bb9981813?w=400",
          "https://images.unsplash.com/photo-1470337458703-46ad1756a187?w=400"
        ],
        "Name": "Margarita",
        "Description": "A classic Mexican cocktail with tequila, lime juice, and orange liqueur. Served with a salted rim for the perfect balance of sweet and sour.",
        "OverallRating": 4.8,
        "TotalReviews": "256",
        "Alcohol": 0.25,
        "Tag": "Contemporary",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Tequila",
            "Quantity": 50
          },
          {
            "ID": 2,
            "Name": "Lime Juice",
            "Quantity": 30
          },
          {
            "ID": 3,
            "Name": "Triple Sec",
            "Quantity": 20
          },
          {
            "ID": 4,
            "Name": "Salt",
            "Quantity": 2
          }
        ],
        "Version": 1.0,
        "IsFavourite": true,
        "DominantColor": "#f4e8c1"
      },
      {
        "ID": 3,
        "ImagePath": "https://images.unsplash.com/photo-1470337458703-46ad1756a187?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1470337458703-46ad1756a187?w=400",
          "https://images.unsplash.com/photo-1609951651556-5334e2706168?w=400"
        ],
        "Name": "Old Fashioned",
        "Description": "The quintessential whiskey cocktail, combining bourbon or rye with sugar and bitters. A timeless American classic that's stood the test of time.",
        "OverallRating": 4.7,
        "TotalReviews": "342",
        "Alcohol": 0.35,
        "Tag": "Classic",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Bourbon Whiskey",
            "Quantity": 60
          },
          {
            "ID": 2,
            "Name": "Sugar Cube",
            "Quantity": 5
          },
          {
            "ID": 3,
            "Name": "Angostura Bitters",
            "Quantity": 3
          },
          {
            "ID": 4,
            "Name": "Water",
            "Quantity": 5
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#d4915e"
      },
      {
        "ID": 4,
        "ImagePath": "https://images.unsplash.com/photo-1560508879-8f4e1a06b4ac?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1560508879-8f4e1a06b4ac?w=400",
          "https://images.unsplash.com/photo-1609951651556-5334e2706168?w=400"
        ],
        "Name": "Manhattan",
        "Description": "A sophisticated blend of whiskey and sweet vermouth with aromatic bitters. The epitome of cocktail elegance from New York City.",
        "OverallRating": 4.6,
        "TotalReviews": "298",
        "Alcohol": 0.30,
        "Tag": "Classic",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Rye Whiskey",
            "Quantity": 60
          },
          {
            "ID": 2,
            "Name": "Sweet Vermouth",
            "Quantity": 30
          },
          {
            "ID": 3,
            "Name": "Angostura Bitters",
            "Quantity": 3
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#8b4513"
      },
      {
        "ID": 5,
        "ImagePath": "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400",
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400"
        ],
        "Name": "Dry Martini",
        "Description": "The iconic gin cocktail that's synonymous with sophistication. Stirred with dry vermouth and garnished with olives or a lemon twist.",
        "OverallRating": 4.5,
        "TotalReviews": "521",
        "Alcohol": 0.32,
        "Tag": "Classic",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Gin",
            "Quantity": 75
          },
          {
            "ID": 2,
            "Name": "Dry Vermouth",
            "Quantity": 15
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#e8f4f8"
      },
      {
        "ID": 6,
        "ImagePath": "https://images.unsplash.com/photo-1509669803555-fd5d97e4d11d?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1509669803555-fd5d97e4d11d?w=400",
          "https://images.unsplash.com/photo-1615332579937-4e9d7a6a8e3d?w=400"
        ],
        "Name": "Negroni",
        "Description": "An Italian aperitif featuring equal parts gin, Campari, and sweet vermouth. Bold, bitter, and beautifully balanced.",
        "OverallRating": 4.4,
        "TotalReviews": "287",
        "Alcohol": 0.24,
        "Tag": "Classic",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Gin",
            "Quantity": 30
          },
          {
            "ID": 2,
            "Name": "Campari",
            "Quantity": 30
          },
          {
            "ID": 3,
            "Name": "Sweet Vermouth",
            "Quantity": 30
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#c44536"
      },
      {
        "ID": 7,
        "ImagePath": "https://images.unsplash.com/photo-1536935338788-846bb9981813?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1536935338788-846bb9981813?w=400",
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400"
        ],
        "Name": "Daiquiri",
        "Description": "Ernest Hemingway's favorite - a simple yet perfect combination of white rum, fresh lime juice, and sugar. Cuban elegance in a glass.",
        "OverallRating": 4.6,
        "TotalReviews": "194",
        "Alcohol": 0.20,
        "Tag": "Classic",
        "Recipe": [
          {
            "ID": 1,
            "Name": "White Rum",
            "Quantity": 60
          },
          {
            "ID": 2,
            "Name": "Lime Juice",
            "Quantity": 20
          },
          {
            "ID": 3,
            "Name": "Simple Syrup",
            "Quantity": 10
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#f5f5dc"
      },
      {
        "ID": 8,
        "ImagePath": "https://images.unsplash.com/photo-1609951651556-5334e2706168?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1609951651556-5334e2706168?w=400",
          "https://images.unsplash.com/photo-1560508879-8f4e1a06b4ac?w=400"
        ],
        "Name": "Whiskey Sour",
        "Description": "A perfectly balanced whiskey cocktail with fresh lemon juice and sugar, often topped with a frothy egg white. Tart and satisfying.",
        "OverallRating": 4.5,
        "TotalReviews": "276",
        "Alcohol": 0.22,
        "Tag": "Classic",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Bourbon Whiskey",
            "Quantity": 50
          },
          {
            "ID": 2,
            "Name": "Lemon Juice",
            "Quantity": 25
          },
          {
            "ID": 3,
            "Name": "Simple Syrup",
            "Quantity": 15
          },
          {
            "ID": 4,
            "Name": "Egg White",
            "Quantity": 20
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#f4e8a7"
      },
      {
        "ID": 9,
        "ImagePath": "https://images.unsplash.com/photo-1546171753-97d7676e4602?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1546171753-97d7676e4602?w=400",
          "https://images.unsplash.com/photo-1560508879-8f4e1a06b4ac?w=400"
        ],
        "Name": "Sazerac",
        "Description": "New Orleans' signature cocktail featuring rye whiskey, absinthe, Peychaud's bitters, and sugar. A legendary American classic.",
        "OverallRating": 4.3,
        "TotalReviews": "168",
        "Alcohol": 0.34,
        "Tag": "Classic",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Rye Whiskey",
            "Quantity": 60
          },
          {
            "ID": 2,
            "Name": "Absinthe",
            "Quantity": 5
          },
          {
            "ID": 3,
            "Name": "Sugar Cube",
            "Quantity": 5
          },
          {
            "ID": 4,
            "Name": "Peychaud's Bitters",
            "Quantity": 4
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#cd853f"
      },
      {
        "ID": 10,
        "ImagePath": "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400",
          "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400"
        ],
        "Name": "Aviation",
        "Description": "A pre-Prohibition gin cocktail with maraschino liqueur, crème de violette, and lemon juice. Beautiful pale sky-blue color.",
        "OverallRating": 4.2,
        "TotalReviews": "142",
        "Alcohol": 0.25,
        "Tag": "Classic",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Gin",
            "Quantity": 45
          },
          {
            "ID": 2,
            "Name": "Maraschino Liqueur",
            "Quantity": 15
          },
          {
            "ID": 3,
            "Name": "Crème de Violette",
            "Quantity": 10
          },
          {
            "ID": 4,
            "Name": "Lemon Juice",
            "Quantity": 20
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#c7d9f5"
      },
      {
        "ID": 11,
        "ImagePath": "https://images.unsplash.com/photo-1470337458703-46ad1756a187?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1470337458703-46ad1756a187?w=400",
          "https://images.unsplash.com/photo-1536935338788-846bb9981813?w=400"
        ],
        "Name": "Sidecar",
        "Description": "A sophisticated cognac cocktail with Cointreau and lemon juice. Created in the 1920s and named after a motorcycle sidecar.",
        "OverallRating": 4.4,
        "TotalReviews": "156",
        "Alcohol": 0.28,
        "Tag": "Classic",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Cognac",
            "Quantity": 50
          },
          {
            "ID": 2,
            "Name": "Cointreau",
            "Quantity": 25
          },
          {
            "ID": 3,
            "Name": "Lemon Juice",
            "Quantity": 25
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#f5deb3"
      },
      {
        "ID": 12,
        "ImagePath": "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400",
          "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400"
        ],
        "Name": "Gin Fizz",
        "Description": "A light and refreshing gin cocktail with lemon juice, sugar, and soda water. Effervescent and invigorating.",
        "OverallRating": 4.3,
        "TotalReviews": "189",
        "Alcohol": 0.14,
        "Tag": "Classic",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Gin",
            "Quantity": 45
          },
          {
            "ID": 2,
            "Name": "Lemon Juice",
            "Quantity": 30
          },
          {
            "ID": 3,
            "Name": "Simple Syrup",
            "Quantity": 15
          },
          {
            "ID": 4,
            "Name": "Soda Water",
            "Quantity": 60
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#f0f8ff"
      },
      {
        "ID": 13,
        "ImagePath": "https://images.unsplash.com/photo-1509669803555-fd5d97e4d11d?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1509669803555-fd5d97e4d11d?w=400",
          "https://images.unsplash.com/photo-1615332579937-4e9d7a6a8e3d?w=400"
        ],
        "Name": "Americano",
        "Description": "The predecessor to the Negroni, featuring Campari, sweet vermouth, and soda water. A lighter, more refreshing aperitif.",
        "OverallRating": 4.1,
        "TotalReviews": "124",
        "Alcohol": 0.12,
        "Tag": "Classic",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Campari",
            "Quantity": 30
          },
          {
            "ID": 2,
            "Name": "Sweet Vermouth",
            "Quantity": 30
          },
          {
            "ID": 3,
            "Name": "Soda Water",
            "Quantity": 50
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#c85a54"
      },
      {
        "ID": 14,
        "ImagePath": "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400",
          "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400"
        ],
        "Name": "Clover Club",
        "Description": "A pre-Prohibition classic with gin, raspberry syrup, lemon juice, and egg white. Pink, frothy, and delightfully elegant.",
        "OverallRating": 4.3,
        "TotalReviews": "138",
        "Alcohol": 0.18,
        "Tag": "Classic",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Gin",
            "Quantity": 45
          },
          {
            "ID": 2,
            "Name": "Raspberry Syrup",
            "Quantity": 15
          },
          {
            "ID": 3,
            "Name": "Lemon Juice",
            "Quantity": 15
          },
          {
            "ID": 4,
            "Name": "Egg White",
            "Quantity": 20
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#ffc0cb"
      },
      {
        "ID": 15,
        "ImagePath": "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400",
          "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400"
        ],
        "Name": "White Lady",
        "Description": "A sophisticated gin sour with Cointreau and lemon juice. Clean, crisp, and refreshing with a silky texture.",
        "OverallRating": 4.2,
        "TotalReviews": "112",
        "Alcohol": 0.26,
        "Tag": "Classic",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Gin",
            "Quantity": 40
          },
          {
            "ID": 2,
            "Name": "Cointreau",
            "Quantity": 20
          },
          {
            "ID": 3,
            "Name": "Lemon Juice",
            "Quantity": 20
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#fffaf0"
      },
      {
        "ID": 16,
        "ImagePath": "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400",
          "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400"
        ],
        "Name": "Ramos Gin Fizz",
        "Description": "A luxurious New Orleans creation requiring 12 minutes of shaking. Gin, cream, egg white, orange flower water, and soda create a creamy cloud.",
        "OverallRating": 4.5,
        "TotalReviews": "95",
        "Alcohol": 0.15,
        "Tag": "Classic",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Gin",
            "Quantity": 45
          },
          {
            "ID": 2,
            "Name": "Heavy Cream",
            "Quantity": 30
          },
          {
            "ID": 3,
            "Name": "Lemon Juice",
            "Quantity": 15
          },
          {
            "ID": 4,
            "Name": "Lime Juice",
            "Quantity": 15
          },
          {
            "ID": 5,
            "Name": "Simple Syrup",
            "Quantity": 15
          },
          {
            "ID": 6,
            "Name": "Egg White",
            "Quantity": 20
          },
          {
            "ID": 7,
            "Name": "Orange Flower Water",
            "Quantity": 3
          },
          {
            "ID": 8,
            "Name": "Soda Water",
            "Quantity": 30
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#fffef7"
      },
      {
        "ID": 17,
        "ImagePath": "https://images.unsplash.com/photo-1536935338788-846bb9981813?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1536935338788-846bb9981813?w=400",
          "https://images.unsplash.com/photo-1470337458703-46ad1756a187?w=400"
        ],
        "Name": "Cosmopolitan",
        "Description": "Made famous by Sex and the City, this pink martini combines vodka, Cointreau, cranberry, and lime. Chic and sophisticated.",
        "OverallRating": 4.2,
        "TotalReviews": "387",
        "Alcohol": 0.22,
        "Tag": "Contemporary",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Vodka",
            "Quantity": 40
          },
          {
            "ID": 2,
            "Name": "Cointreau",
            "Quantity": 15
          },
          {
            "ID": 3,
            "Name": "Cranberry Juice",
            "Quantity": 30
          },
          {
            "ID": 4,
            "Name": "Lime Juice",
            "Quantity": 15
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#ff69b4"
      },
      {
        "ID": 18,
        "ImagePath": "https://images.unsplash.com/photo-1546171753-97d7676e4602?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1546171753-97d7676e4602?w=400",
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400"
        ],
        "Name": "Mai Tai",
        "Description": "Trader Vic's legendary Polynesian cocktail with aged rum, orange curaçao, orgeat, and lime. A tiki bar essential.",
        "OverallRating": 4.6,
        "TotalReviews": "245",
        "Alcohol": 0.22,
        "Tag": "Contemporary",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Aged Rum",
            "Quantity": 40
          },
          {
            "ID": 2,
            "Name": "Dark Rum",
            "Quantity": 20
          },
          {
            "ID": 3,
            "Name": "Orange Curaçao",
            "Quantity": 15
          },
          {
            "ID": 4,
            "Name": "Orgeat Syrup",
            "Quantity": 15
          },
          {
            "ID": 5,
            "Name": "Lime Juice",
            "Quantity": 30
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#f4a460"
      },
      {
        "ID": 19,
        "ImagePath": "https://images.unsplash.com/photo-1560508879-8f4e1a06b4ac?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1560508879-8f4e1a06b4ac?w=400",
          "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400"
        ],
        "Name": "Pina Colada",
        "Description": "Puerto Rico's national drink - a creamy tropical blend of rum, coconut cream, and pineapple juice. Pure vacation in a glass.",
        "OverallRating": 4.4,
        "TotalReviews": "421",
        "Alcohol": 0.13,
        "Tag": "Contemporary",
        "Recipe": [
          {
            "ID": 1,
            "Name": "White Rum",
            "Quantity": 50
          },
          {
            "ID": 2,
            "Name": "Coconut Cream",
            "Quantity": 30
          },
          {
            "ID": 3,
            "Name": "Pineapple Juice",
            "Quantity": 90
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#fffacd"
      },
      {
        "ID": 20,
        "ImagePath": "https://images.unsplash.com/photo-1609951651556-5334e2706168?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1609951651556-5334e2706168?w=400",
          "https://images.unsplash.com/photo-1560508879-8f4e1a06b4ac?w=400"
        ],
        "Name": "Long Island Iced Tea",
        "Description": "A deceptively strong mix of five spirits that tastes like iced tea. Popular party drink with surprising potency.",
        "OverallRating": 4.0,
        "TotalReviews": "312",
        "Alcohol": 0.22,
        "Tag": "Contemporary",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Vodka",
            "Quantity": 15
          },
          {
            "ID": 2,
            "Name": "Tequila",
            "Quantity": 15
          },
          {
            "ID": 3,
            "Name": "White Rum",
            "Quantity": 15
          },
          {
            "ID": 4,
            "Name": "Gin",
            "Quantity": 15
          },
          {
            "ID": 5,
            "Name": "Triple Sec",
            "Quantity": 15
          },
          {
            "ID": 6,
            "Name": "Lemon Juice",
            "Quantity": 30
          },
          {
            "ID": 7,
            "Name": "Simple Syrup",
            "Quantity": 20
          },
          {
            "ID": 8,
            "Name": "Cola",
            "Quantity": 30
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#8b4513"
      },
      {
        "ID": 21,
        "ImagePath": "https://images.unsplash.com/photo-1536935338788-846bb9981813?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1536935338788-846bb9981813?w=400",
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400"
        ],
        "Name": "Caipirinha",
        "Description": "Brazil's national cocktail made with cachaça, lime, and sugar. Simple, refreshing, and authentically Brazilian.",
        "OverallRating": 4.5,
        "TotalReviews": "203",
        "Alcohol": 0.18,
        "Tag": "Contemporary",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Cachaça",
            "Quantity": 60
          },
          {
            "ID": 2,
            "Name": "Lime",
            "Quantity": 50
          },
          {
            "ID": 3,
            "Name": "Sugar",
            "Quantity": 12
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#d4f1d4"
      },
      {
        "ID": 22,
        "ImagePath": "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400",
          "https://images.unsplash.com/photo-1609951651556-5334e2706168?w=400"
        ],
        "Name": "Espresso Martini",
        "Description": "Dick Bradsell's caffeinated creation combining vodka, espresso, coffee liqueur, and sugar. The perfect pick-me-up cocktail.",
        "OverallRating": 4.7,
        "TotalReviews": "456",
        "Alcohol": 0.20,
        "Tag": "Contemporary",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Vodka",
            "Quantity": 50
          },
          {
            "ID": 2,
            "Name": "Coffee Liqueur",
            "Quantity": 25
          },
          {
            "ID": 3,
            "Name": "Fresh Espresso",
            "Quantity": 30
          },
          {
            "ID": 4,
            "Name": "Simple Syrup",
            "Quantity": 10
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#3e2723"
      },
      {
        "ID": 23,
        "ImagePath": "https://images.unsplash.com/photo-1615332579937-4e9d7a6a8e3d?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1615332579937-4e9d7a6a8e3d?w=400",
          "https://images.unsplash.com/photo-1509669803555-fd5d97e4d11d?w=400"
        ],
        "Name": "Aperol Spritz",
        "Description": "Italy's favorite aperitif with Aperol, prosecco, and soda water. Bittersweet, bubbly, and perfect for summer afternoons.",
        "OverallRating": 4.3,
        "TotalReviews": "389",
        "Alcohol": 0.11,
        "Tag": "Contemporary",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Aperol",
            "Quantity": 60
          },
          {
            "ID": 2,
            "Name": "Prosecco",
            "Quantity": 90
          },
          {
            "ID": 3,
            "Name": "Soda Water",
            "Quantity": 30
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#ff6347"
      },
      {
        "ID": 24,
        "ImagePath": "https://images.unsplash.com/photo-1560508879-8f4e1a06b4ac?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1560508879-8f4e1a06b4ac?w=400",
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400"
        ],
        "Name": "Moscow Mule",
        "Description": "Vodka, ginger beer, and lime served in a copper mug. Refreshing, spicy, and distinctively presented.",
        "OverallRating": 4.4,
        "TotalReviews": "298",
        "Alcohol": 0.15,
        "Tag": "Contemporary",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Vodka",
            "Quantity": 50
          },
          {
            "ID": 2,
            "Name": "Ginger Beer",
            "Quantity": 120
          },
          {
            "ID": 3,
            "Name": "Lime Juice",
            "Quantity": 15
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#f5deb3"
      },
      {
        "ID": 25,
        "ImagePath": "https://images.unsplash.com/photo-1609951651556-5334e2706168?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1609951651556-5334e2706168?w=400",
          "https://images.unsplash.com/photo-1470337458703-46ad1756a187?w=400"
        ],
        "Name": "Mint Julep",
        "Description": "The official drink of the Kentucky Derby. Bourbon, mint, sugar, and crushed ice in a frosted silver cup.",
        "OverallRating": 4.2,
        "TotalReviews": "187",
        "Alcohol": 0.30,
        "Tag": "Contemporary",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Bourbon Whiskey",
            "Quantity": 60
          },
          {
            "ID": 2,
            "Name": "Fresh Mint",
            "Quantity": 10
          },
          {
            "ID": 3,
            "Name": "Simple Syrup",
            "Quantity": 15
          },
          {
            "ID": 4,
            "Name": "Water",
            "Quantity": 10
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#98d8c8"
      },
      {
        "ID": 26,
        "ImagePath": "https://images.unsplash.com/photo-1609951651556-5334e2706168?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1609951651556-5334e2706168?w=400",
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400"
        ],
        "Name": "Bloody Mary",
        "Description": "The ultimate brunch cocktail with vodka, tomato juice, and spices. Savory, spicy, and often garnished elaborately.",
        "OverallRating": 4.1,
        "TotalReviews": "334",
        "Alcohol": 0.14,
        "Tag": "Contemporary",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Vodka",
            "Quantity": 45
          },
          {
            "ID": 2,
            "Name": "Tomato Juice",
            "Quantity": 90
          },
          {
            "ID": 3,
            "Name": "Lemon Juice",
            "Quantity": 15
          },
          {
            "ID": 4,
            "Name": "Worcestershire Sauce",
            "Quantity": 5
          },
          {
            "ID": 5,
            "Name": "Hot Sauce",
            "Quantity": 3
          },
          {
            "ID": 6,
            "Name": "Salt",
            "Quantity": 2
          },
          {
            "ID": 7,
            "Name": "Black Pepper",
            "Quantity": 1
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#cd5c5c"
      },
      {
        "ID": 27,
        "ImagePath": "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400",
          "https://images.unsplash.com/photo-1560508879-8f4e1a06b4ac?w=400"
        ],
        "Name": "Sex on the Beach",
        "Description": "A fruity vodka cocktail with peach schnapps, cranberry, and orange juice. Fun, colorful, and crowd-pleasing.",
        "OverallRating": 3.9,
        "TotalReviews": "267",
        "Alcohol": 0.16,
        "Tag": "Contemporary",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Vodka",
            "Quantity": 40
          },
          {
            "ID": 2,
            "Name": "Peach Schnapps",
            "Quantity": 20
          },
          {
            "ID": 3,
            "Name": "Cranberry Juice",
            "Quantity": 40
          },
          {
            "ID": 4,
            "Name": "Orange Juice",
            "Quantity": 40
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#ff7f50"
      },
      {
        "ID": 28,
        "ImagePath": "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400",
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400"
        ],
        "Name": "French 75",
        "Description": "A champagne cocktail with gin, lemon juice, and sugar. Named after a WWI French artillery gun for its kick.",
        "OverallRating": 4.5,
        "TotalReviews": "176",
        "Alcohol": 0.17,
        "Tag": "Contemporary",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Gin",
            "Quantity": 30
          },
          {
            "ID": 2,
            "Name": "Lemon Juice",
            "Quantity": 15
          },
          {
            "ID": 3,
            "Name": "Simple Syrup",
            "Quantity": 15
          },
          {
            "ID": 4,
            "Name": "Champagne",
            "Quantity": 60
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#fffacd"
      },
      {
        "ID": 29,
        "ImagePath": "https://images.unsplash.com/photo-1615332579937-4e9d7a6a8e3d?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1615332579937-4e9d7a6a8e3d?w=400",
          "https://images.unsplash.com/photo-1509669803555-fd5d97e4d11d?w=400"
        ],
        "Name": "Bellini",
        "Description": "Venice's signature cocktail with white peach purée and prosecco. Elegant, fruity, and perfect for celebrations.",
        "OverallRating": 4.3,
        "TotalReviews": "198",
        "Alcohol": 0.09,
        "Tag": "Contemporary",
        "Recipe": [
          {
            "ID": 1,
            "Name": "White Peach Purée",
            "Quantity": 50
          },
          {
            "ID": 2,
            "Name": "Prosecco",
            "Quantity": 100
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#ffdab9"
      },
      {
        "ID": 30,
        "ImagePath": "https://images.unsplash.com/photo-1609951651556-5334e2706168?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1609951651556-5334e2706168?w=400",
          "https://images.unsplash.com/photo-1470337458703-46ad1756a187?w=400"
        ],
        "Name": "Irish Coffee",
        "Description": "Hot coffee with Irish whiskey, sugar, and topped with cream. The perfect warming drink for cold evenings.",
        "OverallRating": 4.4,
        "TotalReviews": "221",
        "Alcohol": 0.12,
        "Tag": "Contemporary",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Irish Whiskey",
            "Quantity": 40
          },
          {
            "ID": 2,
            "Name": "Hot Coffee",
            "Quantity": 120
          },
          {
            "ID": 3,
            "Name": "Brown Sugar",
            "Quantity": 10
          },
          {
            "ID": 4,
            "Name": "Heavy Cream",
            "Quantity": 30
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#4b3621"
      },
      {
        "ID": 31,
        "ImagePath": "https://images.unsplash.com/photo-1536935338788-846bb9981813?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1536935338788-846bb9981813?w=400",
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400"
        ],
        "Name": "Pisco Sour",
        "Description": "Peru's national cocktail with pisco, lime juice, simple syrup, egg white, and Angostura bitters. Tart, frothy, and aromatic.",
        "OverallRating": 4.4,
        "TotalReviews": "154",
        "Alcohol": 0.20,
        "Tag": "Contemporary",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Pisco",
            "Quantity": 60
          },
          {
            "ID": 2,
            "Name": "Lime Juice",
            "Quantity": 30
          },
          {
            "ID": 3,
            "Name": "Simple Syrup",
            "Quantity": 20
          },
          {
            "ID": 4,
            "Name": "Egg White",
            "Quantity": 20
          },
          {
            "ID": 5,
            "Name": "Angostura Bitters",
            "Quantity": 2
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#fffacd"
      },
      {
        "ID": 32,
        "ImagePath": "https://images.unsplash.com/photo-1470337458703-46ad1756a187?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1470337458703-46ad1756a187?w=400",
          "https://images.unsplash.com/photo-1560508879-8f4e1a06b4ac?w=400"
        ],
        "Name": "Porn Star Martini",
        "Description": "A modern classic by Douglas Ankrah featuring vanilla vodka, passion fruit, and prosecco on the side. Fruity and indulgent.",
        "OverallRating": 4.2,
        "TotalReviews": "312",
        "Alcohol": 0.18,
        "Tag": "Modern",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Vanilla Vodka",
            "Quantity": 50
          },
          {
            "ID": 2,
            "Name": "Passion Fruit Liqueur",
            "Quantity": 15
          },
          {
            "ID": 3,
            "Name": "Passion Fruit Purée",
            "Quantity": 15
          },
          {
            "ID": 4,
            "Name": "Lime Juice",
            "Quantity": 10
          },
          {
            "ID": 5,
            "Name": "Simple Syrup",
            "Quantity": 10
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#ffd700"
      },
      {
        "ID": 33,
        "ImagePath": "https://images.unsplash.com/photo-1546171753-97d7676e4602?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1546171753-97d7676e4602?w=400",
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400"
        ],
        "Name": "Jungle Bird",
        "Description": "A tiki cocktail from Malaysia with dark rum, Campari, pineapple juice, and lime. Tropical with a bitter edge.",
        "OverallRating": 4.3,
        "TotalReviews": "143",
        "Alcohol": 0.18,
        "Tag": "Modern",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Dark Rum",
            "Quantity": 45
          },
          {
            "ID": 2,
            "Name": "Campari",
            "Quantity": 22
          },
          {
            "ID": 3,
            "Name": "Pineapple Juice",
            "Quantity": 45
          },
          {
            "ID": 4,
            "Name": "Lime Juice",
            "Quantity": 15
          },
          {
            "ID": 5,
            "Name": "Simple Syrup",
            "Quantity": 15
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#c85a54"
      },
      {
        "ID": 34,
        "ImagePath": "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400",
          "https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400"
        ],
        "Name": "Gin Basil Smash",
        "Description": "A modern German creation by Jörg Meyer with gin, fresh basil, lemon juice, and sugar. Herbaceous and refreshing.",
        "OverallRating": 4.4,
        "TotalReviews": "167",
        "Alcohol": 0.22,
        "Tag": "Modern",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Gin",
            "Quantity": 60
          },
          {
            "ID": 2,
            "Name": "Fresh Basil",
            "Quantity": 10
          },
          {
            "ID": 3,
            "Name": "Lemon Juice",
            "Quantity": 25
          },
          {
            "ID": 4,
            "Name": "Simple Syrup",
            "Quantity": 20
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#d4f1d4"
      },
      {
        "ID": 35,
        "ImagePath": "https://images.unsplash.com/photo-1609951651556-5334e2706168?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1609951651556-5334e2706168?w=400",
          "https://images.unsplash.com/photo-1560508879-8f4e1a06b4ac?w=400"
        ],
        "Name": "Penicillin",
        "Description": "Sam Ross's modern classic combining blended Scotch, lemon juice, honey-ginger syrup, and an Islay Scotch float. Complex and medicinal.",
        "OverallRating": 4.5,
        "TotalReviews": "189",
        "Alcohol": 0.28,
        "Tag": "Modern",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Blended Scotch",
            "Quantity": 60
          },
          {
            "ID": 2,
            "Name": "Lemon Juice",
            "Quantity": 22
          },
          {
            "ID": 3,
            "Name": "Honey-Ginger Syrup",
            "Quantity": 22
          },
          {
            "ID": 4,
            "Name": "Islay Scotch",
            "Quantity": 7
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#f5deb3"
      },
      {
        "ID": 36,
        "ImagePath": "https://images.unsplash.com/photo-1560508879-8f4e1a06b4ac?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1560508879-8f4e1a06b4ac?w=400",
          "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=400"
        ],
        "Name": "Dark 'n' Stormy",
        "Description": "Bermuda's national drink with dark rum and ginger beer. Traditionally made with Gosling's Black Seal rum. Spicy and refreshing.",
        "OverallRating": 4.3,
        "TotalReviews": "198",
        "Alcohol": 0.16,
        "Tag": "Modern",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Dark Rum",
            "Quantity": 60
          },
          {
            "ID": 2,
            "Name": "Ginger Beer",
            "Quantity": 100
          },
          {
            "ID": 3,
            "Name": "Lime Juice",
            "Quantity": 10
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#4a2511"
      },
      {
        "ID": 37,
        "ImagePath": "https://images.unsplash.com/photo-1470337458703-46ad1756a187?w=400",
        "PreviewImages": [
          "https://images.unsplash.com/photo-1470337458703-46ad1756a187?w=400",
          "https://images.unsplash.com/photo-1536935338788-846bb9981813?w=400"
        ],
        "Name": "Paradise",
        "Description": "A classic gin cocktail with apricot brandy and orange juice. A forgotten gem from the golden age of cocktails.",
        "OverallRating": 4.1,
        "TotalReviews": "89",
        "Alcohol": 0.24,
        "Tag": "Classic",
        "Recipe": [
          {
            "ID": 1,
            "Name": "Gin",
            "Quantity": 35
          },
          {
            "ID": 2,
            "Name": "Apricot Brandy",
            "Quantity": 20
          },
          {
            "ID": 3,
            "Name": "Orange Juice",
            "Quantity": 15
          },
          {
            "ID": 4,
            "Name": "Lemon Juice",
            "Quantity": 10
          }
        ],
        "Version": 1.0,
        "IsFavourite": false,
        "DominantColor": "#ffb347"
      }
    ]
    """

    func fetchCocktails() async throws -> [Cocktail] {
        guard let jsonData = dummyJSONString.data(using: .utf8) else {
            throw CocktailServiceError.invalidData
        }

        let decoder = JSONDecoder()
        let cocktails = try decoder.decode([Cocktail].self, from: jsonData)
        return cocktails
    }
}

enum CocktailServiceError: Error {
    case invalidData
    case networkError
    case decodingError
}

//
//  CocktailGridItem.swift
//  CocktailApp
//
//  Created by Sven Borden on 13.11.2025.
//

import SwiftUI

struct CocktailGridItem: View {
    let cocktail: Cocktail
    let onFavoriteToggle: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Cocktail Image
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: cocktail.imagePath)) { phase in
                    switch phase {
                    case .empty:
                        Color.gray200
                            .overlay {
                                ProgressView()
                            }
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    case .failure:
                        Color.gray200
                            .overlay {
                                Image(systemName: "photo")
                                    .foregroundColor(.gray400)
                            }
                    @unknown default:
                        Color.gray200
                    }
                }
                .frame(height: Constants.cocktailTileImageHeight)
                .clipped()
                .cornerRadius(Constants.imageCornerRadius)

                // Favorite Button
                Button(action: onFavoriteToggle) {
                    Image(systemName: cocktail.isFavourite ? "heart.fill" : "heart")
                        .foregroundColor(cocktail.isFavourite ? .primaryColor : .gray400)
                        .font(.system(size: 16))
                        .frame(width: 40, height: 40)
                        .background(Color.white)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.gray300, lineWidth: 1)
                        )
                }
                .padding(8)
            }

            // Cocktail Name
            Text(cocktail.name)
                .font(.custom("Montserrat-SemiBold", size: 14))
                .lineLimit(2)
                .foregroundColor(.primary)

            // Description
            Text(cocktail.description)
                .font(.custom("Montserrat-Medium", size: 12))
                .foregroundColor(.gray600)
                .lineLimit(2)

            // Alcohol & Tag
            HStack {
                Text("\(Int(cocktail.alcohol * 100))%")
                    .font(.custom("Montserrat-Medium", size: 12))
                    .foregroundColor(.gray700)

                Text("|")
                    .foregroundColor(.gray400)

                Text(cocktail.tag)
                    .font(.custom("Montserrat-Medium", size: 12))
                    .foregroundColor(.gray700)
            }
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(Constants.cardCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.cardCornerRadius)
                .stroke(Color.gray200, lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

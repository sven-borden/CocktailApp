//
//  CocktailDetailView.swift
//  CocktailApp
//
//  Created by Sven Borden on 13.11.2025.
//

import SwiftUI

struct CocktailDetailView: View {
    let cocktail: Cocktail
    @ObservedObject var viewModel: CocktailListViewModel

    @State private var currentImageIndex = 0

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Image Carousel
                TabView(selection: $currentImageIndex) {
                    ForEach(Array(cocktail.previewImages.enumerated()), id: \.offset) { index, imagePath in
                        AsyncImage(url: URL(string: imagePath)) { phase in
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
                        .frame(height: Constants.imageHeight)
                        .clipped()
                        .tag(index)
                    }
                }
                .frame(height: Constants.imageHeight)
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))

                // Content Card
                VStack(alignment: .leading, spacing: 16) {
                    // Header: Name & Favorite Button
                    HStack(alignment: .top) {
                        Text(cocktail.name)
                            .font(.custom("Montserrat-SemiBold", size: 20))
                            .foregroundColor(.primary)

                        Spacer()

                        Button(action: {
                            viewModel.toggleFavorite(cocktail)
                        }) {
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
                    }

                    // Alcohol & Get Button
                    HStack(alignment: .center) {
                        HStack(spacing: 4) {
                            Text("\(Int(cocktail.alcohol * 100))%")
                                .font(.custom("Montserrat-Bold", size: 24))
                                .foregroundColor(.primaryColor)

                            Text("alcohol")
                                .font(.custom("Montserrat-Medium", size: 20))
                                .foregroundColor(.gray600)
                        }

                        Spacer()

                        Button(action: {
                            // Placeholder for future functionality
                            print("Get button tapped")
                        }) {
                            Text("Get")
                                .font(.custom("Montserrat-SemiBold", size: 14))
                                .foregroundColor(.white)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 8)
                                .background(Color.primaryColor)
                                .cornerRadius(Constants.buttonCornerRadius)
                        }
                    }

                    Divider()

                    // Cocktail Information
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Cocktail Information")
                            .font(.custom("Montserrat-SemiBold", size: 16))
                            .foregroundColor(.primary)

                        Text(cocktail.description)
                            .font(.custom("Montserrat-Medium", size: 12))
                            .foregroundColor(.gray700)
                            .lineSpacing(4)
                    }

                    Divider()

                    // Ingredients
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Cocktail Ingredients")
                            .font(.custom("Montserrat-SemiBold", size: 16))
                            .foregroundColor(.primary)

                        ForEach(cocktail.recipe) { ingredient in
                            HStack {
                                Text(ingredient.name)
                                    .font(.custom("Montserrat-Medium", size: 14))
                                    .foregroundColor(.gray800)

                                Spacer()

                                Text("\(Int(ingredient.quantity)) ml")
                                    .font(.custom("Montserrat-Medium", size: 14))
                                    .foregroundColor(.gray600)
                            }
                            .padding(.vertical, 4)

                            if ingredient.id != cocktail.recipe.last?.id {
                                Divider()
                            }
                        }
                    }
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(Constants.cardCornerRadius)
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
                .padding(.horizontal, 16)
                .padding(.top, -20)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color.primaryColor, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

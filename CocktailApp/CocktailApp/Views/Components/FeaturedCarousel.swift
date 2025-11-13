//
//  FeaturedCarousel.swift
//  CocktailApp
//
//  Created by Sven Borden on 13.11.2025.
//

import SwiftUI

struct FeaturedCarousel: View {
    let cocktails: [Cocktail]
    let onTap: (Cocktail) -> Void

    @State private var currentIndex = 0
    @State private var timer: Timer?

    var body: some View {
        if cocktails.isEmpty {
            EmptyView()
        } else {
            TabView(selection: $currentIndex) {
                ForEach(Array(cocktails.enumerated()), id: \.element.id) { index, cocktail in
                    Button(action: { onTap(cocktail) }) {
                        ZStack(alignment: .bottomLeading) {
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
                            .frame(height: Constants.carouselHeightPhone)
                            .clipped()

                            // Overlay with cocktail name
                            Text(cocktail.name)
                                .font(.custom("Montserrat-SemiBold", size: 18))
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    Color.primaryColor.opacity(0.8)
                                )
                        }
                    }
                    .tag(index)
                }
            }
            .frame(height: Constants.carouselHeightPhone)
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .onAppear {
                startTimer()
            }
            .onDisappear {
                stopTimer()
            }
        }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: Constants.carouselAutoPlayDelay, repeats: true) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % cocktails.count
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

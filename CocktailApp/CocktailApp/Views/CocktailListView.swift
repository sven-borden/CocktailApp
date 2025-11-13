//
//  CocktailListView.swift
//  CocktailApp
//

import SwiftUI

struct CocktailListView: View {
    @StateObject private var viewModel = CocktailListViewModel()
    @State private var showingAbout = false

    // Responsive grid columns
    private var gridColumns: [GridItem] {
        [GridItem(.adaptive(minimum: 160), spacing: Constants.gridSpacing)]
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Featured Carousel (only if there are favorites)
                    if !viewModel.featuredCocktails.isEmpty {
                        FeaturedCarousel(cocktails: viewModel.featuredCocktails) { cocktail in
                            // TODO: Navigate to detail view
                            print("Tapped featured cocktail: \(cocktail.name)")
                        }
                    }

                    // Cocktails Grid
                    LazyVGrid(columns: gridColumns, spacing: Constants.gridSpacing) {
                        ForEach(viewModel.cocktails) { cocktail in
                            NavigationLink(destination: CocktailDetailView(cocktail: cocktail, viewModel: viewModel)) {
                                CocktailGridItem(cocktail: cocktail) {
                                    viewModel.toggleFavorite(cocktail)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("Cocktails")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.primaryColor, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showingAbout = true
                    }) {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.white)
                    }
                }
            }
            .sheet(isPresented: $showingAbout) {
                AboutView()
            }
            .task {
                await viewModel.loadCocktails()
            }
        }
    }
}

// MARK: - Preview
#Preview {
    CocktailListView()
}

//
//  AboutView.swift
//  CocktailApp
//

import SwiftUI

struct AboutView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    // Hero Image
                    Color.primaryColor
                        .frame(height: 253)
                        .overlay {
                            Image("Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                                .opacity(0.9)
                        }

                    // About Us Card
                    VStack(alignment: .leading, spacing: 16) {
                        Text("About Us")
                            .font(.custom("Montserrat-Bold", size: 20))
                            .foregroundColor(.primary)

                        Text("This application is dedicated to show the many possibilities of drinks at home. Welcome to Borden Cocktails and enjoy a nice evening with friends and drinks.")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .foregroundColor(.gray700)
                            .lineSpacing(4)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(Constants.cardCornerRadius)
                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
                    .padding(.horizontal, 16)
                    .offset(y: -40)
                    .padding(.bottom, 32)
                }
            }
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.primaryColor, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    AboutView()
}

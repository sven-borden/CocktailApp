//
//  AboutView.swift
//  CocktailApp
//
//  Created by Sven Borden on 13.11.2025.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var userService: UserService

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

                    // Your Profile Section
                    if let currentUser = userService.currentUser {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Your Anonymous Profile")
                                .font(.custom("Montserrat-Bold", size: 16))
                                .foregroundColor(.primary)

                            HStack(spacing: 12) {
                                // User Avatar
                                Circle()
                                    .fill(Color.primaryLighter)
                                    .frame(width: 48, height: 48)
                                    .overlay {
                                        Image(systemName: "person.fill")
                                            .font(.system(size: 24))
                                            .foregroundColor(.primaryColor)
                                    }

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(currentUser.displayName)
                                        .font(.custom("Montserrat-SemiBold", size: 16))
                                        .foregroundColor(.primary)

                                    Text("Anonymous User")
                                        .font(.custom("Montserrat-Medium", size: 12))
                                        .foregroundColor(.gray600)
                                }

                                Spacer()
                            }
                        }
                        .padding(16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(Constants.cardCornerRadius)
                        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 24)
                        .offset(y: -20)
                    }

                    // Our Team Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Our Team")
                            .font(.custom("Montserrat-Bold", size: 18))
                            .foregroundColor(.primary)
                            .padding(.horizontal, 16)

                        // Team Grid
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))], spacing: 16) {
                            TeamMemberCard(
                                name: "Sven Borden",
                                designation: "Project Manager"
                            )
                        }
                        .padding(.horizontal, 16)
                    }
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

struct TeamMemberCard: View {
    let name: String
    let designation: String

    var body: some View {
        VStack(spacing: 12) {
            // Profile Image (using SF Symbol as placeholder)
            Circle()
                .fill(Color.primaryLighter)
                .frame(width: 64, height: 64)
                .overlay {
                    Image(systemName: "person.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.primaryColor)
                }

            Text(name)
                .font(.custom("Montserrat-SemiBold", size: 14))
                .foregroundColor(.primary)

            Text(designation)
                .font(.custom("Montserrat-Medium", size: 12))
                .foregroundColor(.gray600)
        }
        .frame(width: 160, height: 160)
        .background(Color.white)
        .cornerRadius(Constants.cardCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.cardCornerRadius)
                .stroke(Color.gray200, lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Preview
#Preview {
    AboutView()
}

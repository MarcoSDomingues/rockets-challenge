//
//  RocketDetailView.swift
//  Rockets
//
//  Created by Marco Domingues on 10/06/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct RocketDetailView: View {
    
    @ObservedObject var viewModel: RocketDetailViewModel

    var body: some View {
        return GeometryReader { geo in
            self.body(for: geo.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        ZStack {
            ScrollView(.vertical) {
                VStack {
                    
                    if let imageURL = viewModel.rocket.rocketImageURL {
                        AnimatedImage(url: imageURL)
                            .resizable()
                            .transition(.fade)
                            .cornerRadius(8)
                            .frame(height: size.width * 0.5)
                    }
                    
                    if let firstFlightDateText = viewModel.rocket.firstFlightDateString {
                        HStack {
                            Text(firstFlightDateText)
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(Color.black)
                            Spacer()
                            badgeView()
                        }
                        .padding(.top, 5)
                    }
                    
                    activeStatusView()
                    
                    Divider()
                    
                    VStack(spacing: 10) {
                        rowView(with: "Country:", subtitle: viewModel.rocket.country)
                        rowView(with: "Cost:", subtitle: viewModel.rocket.cost)
                    }
                    .padding(.top)
                }
                .padding()
                .cardify(isShadowEnabled: true)
                .padding()
                
                if let description = viewModel.rocket.description {
                    Text(description)
                        .font(.body)
                        .foregroundColor(Color.black)
                        .lineLimit(nil)
                        .padding([.leading, .trailing, .bottom])
                }
                
                Button {
                    viewModel.send(event: .onShowWikipedia)
                } label: {
                    Text("🚀 Wikipedia")
                }
                .padding()
            }
        }
        .sheet(isPresented: $viewModel.showsWikipedia) {
            if let url = viewModel.rocket.wikipediaURL {
                SafariView(url: url)
            }
        }
        .navigationBarTitle(viewModel.rocket.name ?? "", displayMode: .large)
    }
    
    @ViewBuilder
    private func activeStatusView() -> some View {
        HStack {
            Text("Active:")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(Color.black)
            
            Spacer()
            
            Toggle("", isOn: $viewModel.isActive)
                .disabled(true)
        }
        .padding(.vertical)
    }
    
    @ViewBuilder
    private func rowView(with title: String, subtitle: String?) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(Color.black)
            
            Spacer()
            
            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
            }
        }
    }
    
    @ViewBuilder
    private func badgeView() -> some View {
        if let successRateString = viewModel.rocket.successRateString, let color = viewModel.rocket.badgeColor {
            Text(successRateString)
                .foregroundColor(Color.white)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .background(Capsule().foregroundColor(Color(color)))
        }
    }
    
}

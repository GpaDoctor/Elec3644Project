//
//  SplashScreenView.swift
//  CookingMaster
//
//  Created by Kay Cheung on 26/11/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var animationScale: CGFloat = 0.8
    @State private var animationOpacity: Double = 0.5
    @StateObject private var locationManager = LocationManager()
    let persistenceController = PersistenceController.shared
    
    let foodImages = ["food1", "food2", "food3", "food4", "food5", "food6", "food7", "food8", "food9", "food10"]
    
    var body: some View {
        ZStack {
            if isActive {
                AppView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(locationManager)
            } else {
                SplashScreenContent(foodImages: foodImages)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { // 延長等待時間到4秒
                self.isActive = true
            }
        }
    }
}

struct SplashScreenContent: View {
    @State private var animationScale: CGFloat = 0.8
    @State private var animationOpacity: Double = 0.5
    @State private var offset: CGFloat = 0
    @State private var opacity: Double = 0
    @State private var finalScale: CGFloat = 1.0
    let foodImages: [String]
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                let repeatingImages = Array(repeating: foodImages, count: 5).flatMap { $0 } // 增加到5次重複
                
                HStack(spacing: -1) {
                    ForEach(repeatingImages.indices, id: \.self) { index in
                        VStack(spacing: 0) {
                            FilmHoles()
                            
                            Image(repeatingImages[index])
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width / 3.5) 
                                .clipped()
                                .overlay(
                                    Color.green
                                        .opacity(0.5)
                                        .blendMode(.softLight)
                                )
                                .overlay(
                                    Color.black
                                        .opacity(0.8)
                                        .blendMode(.multiply)
                                )
                                .brightness(-0.1)
                                .contrast(1.1)
                            
                            FilmHoles()
                        }
                        .background(Color.black)
                    }
                }
                .offset(x: offset)
                .onAppear {
                    withAnimation(.linear(duration: 15).repeatForever(autoreverses: false)) { // 減慢移動速度
                        offset = -geometry.size.width * 4
                    }
                }
            }
            
            Rectangle()
                .fill(Color.black)
                .opacity(0.05)
                .ignoresSafeArea()
                .blendMode(.multiply)
            
            VStack {
                Spacer()
                
                Text("Cooking Master")
                    .font(.system(size: 48)) // 增大字體
                    .fontWeight(.black)
                    .foregroundColor(Color(hue: 0.262, saturation: 0.914, brightness: 0.728))
                                
                Circle()
                    .fill(Color(red: 0.69, green: 0.85, blue: 0.53))
                    .frame(width: 200, height: 200) // 增大圓圈
                    .overlay(
                        Image("CookingMaster-cover")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160, height: 160) // 增大圖示
                            .opacity(opacity)
                    )
                        
                Text("   ")
                Text("   ")
                Text("Get started with Cooking Master")
                    .font(.custom("AladdinRegular", size: 25)) // 增大字體
                    .foregroundColor(.white)
                    .opacity(opacity)

                Spacer()
            }
            .scaleEffect(finalScale)
            .opacity(animationOpacity)
            .onAppear {
                withAnimation(.easeInOut(duration: 1.5)) {
                    opacity = 1.0
                    animationOpacity = 1.0
                    finalScale = 1.1 // 最終放大效果
                }
                
                // 2秒後縮小回正常大小
                DispatchQueue.main.asyncAfter(deadline: .now() ) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        finalScale = 1.0
                    }
                }
            }
        }
    }
}

struct FilmHoles: View {
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<8) { _ in
                Circle()
                    .fill(Color.black)
                    .frame(width: 8, height: 8)
                    .overlay(
                        Circle()
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
        }
        .frame(height: 20)
        .background(Color.gray.opacity(0.3))
    }
}

#Preview {
    SplashScreenView()
}

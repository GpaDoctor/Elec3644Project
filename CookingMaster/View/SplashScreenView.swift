//
//  SplashScreenView.swift
//  CookingMaster
//
//  Created by Kay Cheung on 26/11/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @StateObject private var locationManager = LocationManager()
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        if isActive{
            AppView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(locationManager)
        } else {
            VStack{
                ZStack{
                    Color.colorGreenMedium
                        .ignoresSafeArea()
                    VStack{
                        Image("CookingMaster-cover")
                            .resizable()
                            .scaledToFill()
                            .frame(width:400, height: 300)
                            .clipped()
                        Text("Cooking Master")
                            .font(.system(size:40))
                            .fontWeight(.heavy)
                            .foregroundColor(Color(hue: 0.001, saturation: 0.589, brightness: 0.235))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration:1.5)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now()+2.0, execute: {
                        self.isActive = true
                    })
                }
            }
            
        }

        
    }
}

#Preview {
    SplashScreenView()
}

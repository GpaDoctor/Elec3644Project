//
//  GetLookAroundScene.swift
//  CookingMaster
//
//  Author Name: Wong Lok Wang (3035947477)
//

import SwiftUI
import MapKit

struct GetLookAroundScene: View {
    
    @State private var lookAroundScene: MKLookAroundScene?
    var mapItem: MKMapItem
    @Binding var showDirection: Bool
    
    func getLookAroundScene(){
        lookAroundScene = nil
        Task{
            let request = MKLookAroundSceneRequest(coordinate: mapItem.placemark.coordinate)
            lookAroundScene = try? await request.scene
        }
    }
    var body: some View {
        ZStack{
            if lookAroundScene == nil {
                ContentUnavailableView("No Look Around Scene Available", systemImage: "eye.slash")
            } else {
                LookAroundPreview(scene: $lookAroundScene) .overlay(alignment: .bottomTrailing) {
                    HStack {
                        Text ("\(mapItem.name ?? "")")
                        Button{
                            showDirection = true} label:{
                                Label("Show Driving Direction", systemImage: "car")
                            }
                            .buttonStyle(.bordered)
                        }
                    .labelStyle(.iconOnly)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding (10)
                }
            }
        }
        .onAppear {
            getLookAroundScene()
        }
        .onChange(of: mapItem) {
            getLookAroundScene()
                
                
            }
        }
    }


//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Itunu Raimi on 02/03/2021.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Button(action: {
                showInfoView.toggle()
            }, label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }) // Button
            .sheet(isPresented: $showInfoView, content: {
                InfoView()
            })
            .accentColor(.primary)
            
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button(action: {
                showGuideView.toggle()
            }, label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }) // Button
            .sheet(isPresented: $showGuideView, content: {
                GuideView()
            })
            .accentColor(.primary)
        } // HStack
        .padding()
    }
}

// MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
    @State static var showGuide = false
    @State static var showInfo = false
    static var previews: some View {
        HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
    }
}

//
//  GuideComponent.swift
//  Honeymoon
//
//  Created by Itunu Raimi on 02/03/2021.
//

import SwiftUI

struct GuideComponent: View {
    // MARK: - PROPERTIES
    var title: String
    var subtitle: String
    var description: String
    var icon : String
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.pink)
            
            VStack(alignment: .center, spacing: 4, content: {
                HStack {
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    Text(subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                } // HStack
                Divider().padding(.bottom, 4)
                
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }) // VStack
        }) // HStack
        
    }
}

// MARK: - PREVIEW
struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponent(title: "Title", subtitle: "Swipe right", description: "This is a placeholder.This is a placeholder.This is a placeholder.This is a placeholder.This is a placeholder", icon: "heart.circle")
            .previewLayout(.sizeThatFits)
    }
}

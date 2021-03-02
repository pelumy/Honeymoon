//
//  ContentView.swift
//  Honeymoon
//
//  Created by Itunu Raimi on 02/03/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo = false
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
            
            Spacer()
            
            CardView(honeymoon: honeymoonData[1])
                .padding()
            
            Spacer()
            
            FooterView(showBookingAlert: $showAlert)
        } // VStack
        .alert(isPresented: $showAlert, content: {
            Alert(
                title: Text("SUCCESS"),
                message: Text("Wishing the new couple a lovely and precious time spent together."),
                dismissButton: .default(Text("Happy Honeymoon!"))) 
        })
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
    @GestureState var dragState = DragState.inactive
    
    // MARK: - CARDVIEWS
    var cardViews: [CardView] =  {
        var views = [CardView]()
        for index in 0..<honeymoonData.count {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        return views
    }()
    
    // MARK: - TOP CARD
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0
    }
    
    // MARK: - DRAG STATES
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // MARK: - HEADER
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.default)
            
            Spacer()
            
            // MARK: - CARDS
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(isTopCard(cardView: cardView) ? 1 : 0)
                        .offset(x: isTopCard(cardView: cardView) ? dragState.translation.width : 0, y: isTopCard(cardView: cardView) ? dragState.translation.height : 0)
                        .scaleEffect(dragState.isDragging && isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: isTopCard(cardView: cardView) ? Double(dragState.translation.width / 12) : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                                    .sequenced(before: DragGesture())
                                    .updating($dragState, body: { (value, state, transaction) in
                                        switch value {
                                        case .first(true):
                                            state = .pressing
                                        case .second(true, let drag):
                                            state = .dragging(translation: drag?.translation ?? .zero)
                                        default:
                                            break
                                        }
                                    })
                        )
                } // Loop
            } // ZStack
            .padding(.horizontal)
            
            Spacer()
            
            // MARK: - FOOTER
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.default)
            
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

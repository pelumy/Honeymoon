//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Itunu Raimi on 02/03/2021.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}


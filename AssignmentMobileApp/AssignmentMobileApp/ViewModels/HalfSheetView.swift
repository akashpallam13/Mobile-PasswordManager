//
//  HalfSheetView.swift
//  AssignmentMobileApp
//
//  Created by Pallam Madhukar on 4/18/25.
//

import Foundation
import SwiftUI

struct HalfSheet<Content: View>: View {
    @Binding var isPresented: Bool
    let content: Content

    init(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._isPresented = isPresented
        self.content = content()
    }

    var body: some View {
        ZStack {
            if isPresented {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isPresented = false
                        }
                    }

                VStack {
                    Spacer()

                    content
                        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white))
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut, value: isPresented)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

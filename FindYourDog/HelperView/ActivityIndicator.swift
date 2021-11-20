//
//  ActivityIndicator.swift
//  FindYourDog
//
//  Created by Dheeraj Verma on 20/11/21.
//

import SwiftUI

struct ActivityIndicator: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black.opacity(0.23))
                .edgesIgnoringSafeArea(.all)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(x: 2, y: 2, anchor: .center)
        }
        .opacity(appState.shouldShowActivityIndicator ? 1 : 0)
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}

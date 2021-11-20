//
//  SplashView.swift
//  FindYourDog
//
//  Created by Dheeraj Verma on 17/11/21.
//

import SwiftUI

struct SplashView: View {
    
    @State var shouldHideSplash = false
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack {
            if shouldHideSplash {
                decideNextScreen()
            }
            ZStack {
                Text(StringConstants.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .animation(.easeIn)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .opacity(shouldHideSplash ? 0 : 1)
            .onAppear(perform: {
                animateOutSplash()
            })
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private func decideNextScreen() -> Dashboard {
        return Dashboard(dashboardViewModel: DashboardViewModel(appState: appState))
    }
    private func animateOutSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            shouldHideSplash = true
        }
    }
  }

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

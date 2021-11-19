//
//  SplashView.swift
//  FindYourDog
//
//  Created by Dheeraj Verma on 17/11/21.
//

import SwiftUI
var message =  "Find Your Dog"
struct SplashView: View {
    @State var shouldHideSplash = false
    var body: some View {
        ZStack {
            decideNextScreen()
            ZStack {
                Text("\(message)")
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
        return Dashboard(dashboardViewModel: DashboardViewModel())
    }
    private func animateOutSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            shouldHideSplash = true
        }
    }
  }

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

//
//  HostingController.swift
//  FindYourDog
//
//  Created by Dheeraj Verma on 20/11/21.
//

import SwiftUI

class HostingController<ContentView>: UIHostingController<ContentView> where ContentView: View {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

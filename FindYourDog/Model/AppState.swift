//
//  AppState.swift
//  FindYourDog
//
//  Created by Dheeraj Verma on 20/11/21.
//

import Foundation

class AppState: NSObject, ObservableObject {
    @Published var shouldShowActivityIndicator = false
}

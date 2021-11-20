//
//  AlertView.swift
//  FindYourDog
//
//  Created by Dheeraj Verma on 20/11/21.
//

import Foundation
import SwiftUI

enum AlerType {
    case withTitleAndMessageOneButton
}

struct AlertView: View {
    var alertType: AlerType = .withTitleAndMessageOneButton
    @Binding var selectedShow: Bool
    var title = ""
    var message = ""
    var primaryButton: Alert.Button?
    var body: some View {
      if alertType == .some(.withTitleAndMessageOneButton) {
            ZStack {}
                .alert(isPresented: $selectedShow, content: { () -> Alert in
                    return Alert(title: Text(title), message: Text(message), dismissButton: primaryButton!)
                })
        }
    }
}

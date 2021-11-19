//
//  PassThroughWindow.swift
//  FindYourDog
//
//  Created by Dheeraj Verma on 20/11/21.
//


import UIKit

class PassThroughWindow: UIWindow {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let hitView = super.hitTest(point, with: event) else { return nil }
        return rootViewController?.view == hitView ? nil : hitView
    }
}

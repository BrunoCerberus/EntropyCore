//
//  View+Extensions.swift
//  GitHubApp
//
//  Created by bruno on 21/08/23.
//

import SwiftUI

public extension View {
    var wrappedViewController: UIViewController {
        let controller = UIHostingController(rootView: self.testing(true))
        controller.overrideUserInterfaceStyle = .dark
        return controller
    }
}

//
//  NavigationRouter.swift
//  GitHubApp
//
//  Created by bruno on 29/05/23.
//

import UIKit

/// Protocol for navigation routers that handle routing events from views.
///
/// @MainActor ensures all navigation operations happen on the main thread,
/// which is required for UIKit and SwiftUI navigation.
@MainActor
public protocol NavigationRouter: Equatable {
    // Navigation event that will be triggered by View
    associatedtype NavigationEventType

    var navigation: UINavigationController? { get set }
    func route(navigationEvent: NavigationEventType)
}

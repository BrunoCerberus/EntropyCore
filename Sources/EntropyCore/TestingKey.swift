//
//  TestingKey.swift
//  GitHubApp
//
//  Created by bruno on 21/08/23.
//

import SwiftUI

@MainActor
public struct TestingKey: @preconcurrency EnvironmentKey {
    public static var defaultValue: Bool = false
}

public extension EnvironmentValues {
    var isTesting: Bool {
        get { self[TestingKey.self] }
        set { self[TestingKey.self] = newValue }
    }
}

public extension View {
    func testing(_ value: Bool) -> some View {
        self.environment(\.isTesting, value)
    }
}

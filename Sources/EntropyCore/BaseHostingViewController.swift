//
//  BaseHostingViewController.swift
//  GitHubApp
//
//  Created by bruno on 12/08/23.
//

import SwiftUI

public class BaseHostingController<Content: View>: UIHostingController<Content> {
    #if DEBUG
    deinit {
        print("\(Self.self) was deallocated")
    }
    #endif
}

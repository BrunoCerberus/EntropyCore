//
//  AsyncImageViewer.swift
//  GitHubApp
//
//  Created by bruno on 21/08/23.
//

import SwiftUI

public struct AsyncImageViewer<Placeholder: View>: View {

    @Environment(\.isTesting) var isTesting: Bool

    public let url: URL?
    public let placeholder: Placeholder

    public init(url: URL?) where Placeholder == EmptyView {
        self.url = url
        self.placeholder = EmptyView()
    }

    public init(url: URL?, placeholder: @escaping () -> Placeholder) {
        self.url = url
        self.placeholder = placeholder()
    }

    public var body: some View {
        if !isTesting {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
        } else {
            Image("Schrodie")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
        }
    }
}

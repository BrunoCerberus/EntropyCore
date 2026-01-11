//
//  CombineViewModel.swift
//  EntropyCore
//
//  Created by bruno on 29/05/23.
//

import Combine

/// A ViewModel protocol for Combine-based unidirectional data flow.
///
/// This protocol defines the contract for ViewModels in a UDF architecture where:
/// - Views observe `viewState` for UI updates
/// - Views send user interactions via `handle(event:)`
/// - ViewModels transform events into domain actions and reduce domain state to view state
///
/// @MainActor ensures all UI-related state and event handling happens on the main thread,
/// providing thread safety for SwiftUI view updates.
@MainActor
public protocol CombineViewModel: ObservableObject {
    associatedtype ViewState: Equatable
    associatedtype ViewEvent

    /// The current view state that the View observes for rendering.
    var viewState: ViewState { get }

    /// Handles a view event from the UI layer.
    ///
    /// - Parameter event: A `ViewEvent` sent from the View
    func handle(event: ViewEvent)
}

/// Type-erased wrapper for CombineViewModel to enable dynamic dispatch.
@MainActor
public final class AnyCombineViewModel<ViewState: Equatable, ViewEvent>: CombineViewModel {
    public var viewState: ViewState {
        viewStateGetter()
    }

    private let viewEventHandler: (ViewEvent) -> Void
    private let viewStateGetter: () -> ViewState
    private var subscriptions: Set<AnyCancellable> = []

    public init<VM: CombineViewModel>(viewModel: VM) where VM.ViewState == ViewState,
        VM.ViewEvent == ViewEvent
    {
        viewEventHandler = viewModel.handle(event:)
        viewStateGetter = { viewModel.viewState }
        viewModel.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }.store(in: &subscriptions)
    }

    public func handle(event: ViewEvent) {
        viewEventHandler(event)
    }
}

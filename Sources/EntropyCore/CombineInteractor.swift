//
//  CombineInteractor.swift
//  EntropyCore
//
//  Created by bruno on 29/05/23.
//

import Combine
import Foundation

/// A domain interactor protocol for Combine-based unidirectional data flow.
///
/// This protocol defines the contract for domain interactors that:
/// - Manage domain state via `statePublisher`
/// - Process domain actions via `dispatch(action:)`
/// - Encapsulate business logic and side effects
///
/// @MainActor ensures all state mutations happen on the main thread,
/// providing thread safety for UI-related operations.
@MainActor
public protocol CombineInteractor {
    associatedtype DomainState: Equatable
    associatedtype DomainAction

    /// Publisher that emits the current domain state.
    var statePublisher: AnyPublisher<DomainState, Never> { get }

    /// Dispatches an action to be processed by the interactor.
    ///
    /// - Parameter action: A `DomainAction` to process
    func dispatch(action: DomainAction)
}

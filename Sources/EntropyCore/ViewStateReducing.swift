//
//  ViewStateReducing.swift
//  EntropyCore
//
//  Protocol for transforming domain state into view state.
//

import Foundation

/// Protocol for transforming domain state into view state.
///
/// In a UDF architecture, the reducer is responsible for mapping
/// the domain layer's state representation to a format suitable
/// for the view layer. This separation allows:
/// - Domain state to remain focused on business concerns
/// - View state to be optimized for UI rendering
/// - Clear boundaries between layers
public protocol ViewStateReducing {
    associatedtype DomainState
    associatedtype ViewState

    /// Transforms domain state into view state.
    ///
    /// - Parameter domainState: The current domain state
    /// - Returns: The corresponding view state for rendering
    func reduce(domainState: DomainState) -> ViewState
}

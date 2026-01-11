//
//  DomainEventActionMap.swift
//  EntropyCore
//
//  Protocol for mapping view events to domain actions.
//

import Foundation

/// Protocol for mapping view events to domain actions.
///
/// In a UDF architecture, the event-action map translates UI events
/// into domain-level actions. This separation allows:
/// - Views to remain agnostic of domain logic
/// - Clear intent mapping from user interactions to business operations
/// - Filtering of events that don't require domain processing
public protocol DomainEventActionMap {
    associatedtype ViewEvent
    associatedtype DomainAction

    /// Maps a view event to a domain action.
    ///
    /// - Parameter event: The view event to map
    /// - Returns: The corresponding domain action, or nil if no action is needed
    func map(event: ViewEvent) -> DomainAction?
}

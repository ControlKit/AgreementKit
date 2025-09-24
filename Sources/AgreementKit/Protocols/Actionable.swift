//
//  Actionable.swift
//  AgreementKit
//
//  Created by Maziar Saadatfar on 9/25/25.
//
public protocol Actionable: AnyObject {
    var actionService: ActionServiceProtocol { get set }
    @discardableResult
    func postAction(request: ActionRequest) async throws -> ActionResponse?
}

extension Actionable {
    @discardableResult
    public func postAction(request: ActionRequest) async throws -> ActionResponse? {
        return try await actionService.action(request: request)
    }
}

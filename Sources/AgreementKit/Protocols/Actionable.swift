//
//  Actionable.swift
//  AgreementKit
//
//  Created by Maziar Saadatfar on 9/25/25.
//
public protocol Actionable: AnyObject {
    func viewAction()
    func acceptAction()
    func declineAction()
}

public extension Actionable where Self: AgreementViewModel {
    @discardableResult
    func postAction(request: ActionRequest) async throws -> ActionResponse? {
        return try await actionService.action(request: request)
    }
    func viewAction() {
        Task {
            let request = ActionRequest(
                appId: serviceConfig.appId,
                agreemntId: response.data.id,
                action: .view
            )
            try await postAction(request: request)
        }
    }
    
    func acceptAction() {
        Task {
            let request = ActionRequest(
                appId: serviceConfig.appId,
                agreemntId: response.data.id,
                action: .accept
            )
            try await postAction(request: request)
        }
    }
    
    func declineAction() {
        Task {
            let request = ActionRequest(
                appId: serviceConfig.appId,
                agreemntId: response.data.id,
                action: .decline
            )
            try await postAction(request: request)
        }
    }
}

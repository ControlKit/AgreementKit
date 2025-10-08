//
//  Actionable.swift
//  AgreementKit
//
//  Created by Maziar Saadatfar on 9/25/25.
//
import ControlKitBase
public protocol Actionable: AnyObject {
    func viewAction()
    func acceptAction()
    func declineAction()
}

public extension Actionable where Self: AgreementViewModel {
    @discardableResult
    func postAction(request: ActionRequest) async throws -> Result<ActionResponse>? {
        return try await actionService.execute(request: request)
    }
    func viewAction() {
        Task {
            var request = ActionRequest(
                route: .agreement,
                appId: serviceConfig.appId,
                sdkVersion: agreementKit_Version,
                action: .view,
                itemId: self.response.data.id,
            )
            request.extraParameter = "\(request.itemId ?? "")"
            let _: Result<ActionResponse> = try await actionService.execute(request: request)
        }
    }
    
    func acceptAction() {
        Task {
            var request = ActionRequest(
                route: .agreement,
                appId: serviceConfig.appId,
                sdkVersion: agreementKit_Version,
                action: .accept,
                itemId: self.response.data.id,
            )
            request.extraParameter = "\(request.itemId ?? "")"
            let _: Result<ActionResponse> = try await actionService.execute(request: request)
        }
    }
    
    func declineAction() {
        Task {
            var request = ActionRequest(
                route: .agreement,
                appId: serviceConfig.appId,
                sdkVersion: agreementKit_Version,
                action: .decline,
                itemId: self.response.data.id,
            )
            request.extraParameter = "\(request.itemId ?? "")"
            let _: Result<ActionResponse> = try await actionService.execute(request: request)
        }
    }
}

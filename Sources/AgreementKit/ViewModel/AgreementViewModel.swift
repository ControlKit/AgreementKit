//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 9/29/23.
//
import Foundation
import UIKit

public protocol AgreementViewModel: Actionable {
    var response: AgreementResponse { get set }
    var serviceConfig: AgreementServiceConfig { get set }
    var actionService: ActionServiceProtocol { get set }
}

public final class DefaultAgreementViewModel: AgreementViewModel {
    public var serviceConfig: AgreementServiceConfig
    public var actionService: ActionServiceProtocol
    public var response: AgreementResponse
    
    public init(
        serviceConfig: AgreementServiceConfig,
        response: AgreementResponse,
        actionService: ActionServiceProtocol = ActionService()
    ) {
        self.serviceConfig = serviceConfig
        self.response = response
        self.actionService = actionService
    }
}

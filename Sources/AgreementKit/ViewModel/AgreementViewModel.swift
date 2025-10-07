//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 9/29/23.
//
import Foundation
import UIKit
import ControlKitBase

public protocol AgreementViewModel: Actionable {
    var response: AgreementResponse { get set }
    var serviceConfig: AgreementServiceConfig { get set }
    var actionService: GenericServiceProtocol { get set }
}

public final class DefaultAgreementViewModel: AgreementViewModel {
    public var serviceConfig: AgreementServiceConfig
    public var actionService: GenericServiceProtocol
    public var response: AgreementResponse
    
    public init(
        serviceConfig: AgreementServiceConfig,
        response: AgreementResponse,
        actionService: GenericServiceProtocol = GenericService()
    ) {
        self.serviceConfig = serviceConfig
        self.response = response
        self.actionService = actionService
    }
}

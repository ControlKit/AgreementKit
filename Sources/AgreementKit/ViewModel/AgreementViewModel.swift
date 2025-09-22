//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 9/29/23.
//
import Foundation
import UIKit

public protocol AgreementViewModel {
    var agreementService: AgreementServiceProtocol { get set }
    var serviceConfig: AgreementServiceConfig { get set }
    var response: AgreementResponse? { get set }
    var request: AgreementRequest { get }
}

public final class DefaultAgreementViewModel: AgreementViewModel, Agreementable {
    public var agreementService: AgreementServiceProtocol
    public var serviceConfig: AgreementServiceConfig
    public var response: AgreementResponse?
    
    public init(serviceConfig: AgreementServiceConfig,
                agreementService: AgreementServiceProtocol = AgreementService()
    ) {
        self.agreementService = agreementService
        self.serviceConfig = serviceConfig
    }
    
    public var request: AgreementRequest {
        return AgreementRequest(
            name: "",
            appId: serviceConfig.appId,
            route: serviceConfig.route,
            sdkVersion: serviceConfig.sdkVersion
        )
    }
}

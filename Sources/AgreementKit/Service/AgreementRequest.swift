//
//  AgreementRequest.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import ControlKitBase
public struct AgreementRequest: GenericRequest {
    public var itemId: String?
    public var extraParameter: String?
    public var name: String
    public var appId: String
    public var httpMethod: HTTPMethod = .get
    public var route: ControlKitItem = .agreement
    public var applicationVersion: String = Bundle.main.releaseVersionNumber ?? String()
    public var deviceUUID: String = CKDeviceUUID
    public var sdkVersion: String = agreementKit_Version
    
    public var headers: [String: String] {
        return ["x-app-id": appId,
                "x-sdk-version": sdkVersion,
                "x-version": applicationVersion,
                "x-device-uuid": deviceUUID]
    }
    public var body: [String: String] {
        return ["name": name]
    }
}

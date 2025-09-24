//
//  AgreementRequest.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public struct AgreementRequest {
    public var name: String
    public var appId: String = Bundle.main.bundleIdentifier ?? String()
    public var route: String = "https://tauri.ir/api/terms-and-conditions"
    public var deviceUUID: String = UUID().uuidString
    public var sdkVersion: String = agreementKit_Version
    
    var headers: [String: String] {
        return ["x-app-id": appId,
                "x-sdk-version": sdkVersion,
                "x-version": "1",
                "x-device-uuid": deviceUUID]
    }
    var params: [String: String] {
        return ["name": name]
    }
}

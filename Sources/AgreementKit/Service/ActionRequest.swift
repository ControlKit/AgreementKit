//
//  ActionRequest.swift
//  AgreementKit
//
//  Created by Maziar Saadatfar on 9/1/25.
//
import Foundation
public struct ActionRequest {
    public var appId: String
    public var agreemntId: String
    public var action: AgreementAction
    public var route: String = "https://tauri.ir/api/terms-and-conditions/"
    public var deviceUUID: String = UUID().uuidString
    public var sdkVersion: String = agreementKit_Version
    public var applicationVersion: String = Bundle.main.releaseVersionNumber ?? String()
    
    var headers: [String: String] {
        return ["x-app-id": appId,
                "x-sdk-version": sdkVersion,
                "x-version": applicationVersion,
                "x-device-uuid": deviceUUID]
    }
    
    var params: [String: String] {
        return [
            "action": action.rawValue
        ]
    }
}

public enum AgreementAction: String {
    case view = "VIEW"
    case accept = "ACCEPT"
    case decline = "DECLINE"
}
  

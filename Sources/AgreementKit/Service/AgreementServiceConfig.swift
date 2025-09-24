//
//  AgreementServiceConfig.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public struct AgreementServiceConfig {
    public init(style: AgreementViewStyle = .darkMode,
                name: String,
                appId: String,
                language: String,
                version: String) {
        self.viewConfig = AgreementViewStyle.getViewConfigWithStyle(style: style, lang: language)
        self.appId = appId
        self.version = version
        self.name = name
    }
    public var name: String
    public var appId: String
    public var version: String = "1"
    public var sdkVersion: String = agreementKit_Version
    public var viewConfig: AgreementViewConfig
}

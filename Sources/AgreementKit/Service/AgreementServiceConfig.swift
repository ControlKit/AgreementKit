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
                language: CKLanguage,
                version: String) {
        self.viewConfig = AgreementViewStyle.getViewConfigWithStyle(style: style, lang: language)
        self.appId = appId
        self.version = version
        self.language = language
        self.name = name
    }
    public var name: String
    public var appId: String
    public var version: String
    public var language: CKLanguage
    public var sdkVersion: String = agreementKit_Version
    public var viewConfig: AgreementViewConfig
}

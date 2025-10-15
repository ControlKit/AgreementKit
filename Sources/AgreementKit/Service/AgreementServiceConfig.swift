//
//  AgreementServiceConfig.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import ControlKitBase
public struct AgreementServiceConfig {
    public init(style: AgreementViewStyle = .darkMode,
                name: String,
                appId: String,
                language: CKLanguage) {
        self.viewConfig = AgreementViewStyle.getViewConfigWithStyle(style: style, lang: language)
        self.appId = appId
        self.language = language
        self.name = name
    }
    public var name: String
    public var appId: String
    public var language: CKLanguage
    public var sdkVersion: String = agreementKit_Version
    public var viewConfig: AgreementViewConfig
}

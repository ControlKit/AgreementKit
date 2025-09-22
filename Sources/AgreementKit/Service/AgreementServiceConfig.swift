//
//  AgreementServiceConfig.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public struct AgreementServiceConfig {
    public init(style: AgreementViewStyle = .darkMode,
                appId: String,
                language: String,
                version: String) {
        self.viewConfig = AgreementViewStyle.getViewConfigWithStyle(style: style, lang: language)
        self.appId = appId
        self.version = version
    }
    public var route: String = "https://tauri.ir/api/terms-and-conditions"
    public var appId: String = "9fee1663-e80e-46ad-8cd9-357263375a9c" //Bundle.main.bundleIdentifier ?? String()
    public var version: String = "1"//Bundle.main.releaseVersionNumber ?? String()
    public var sdkVersion: String = "1.0.0"
    public var viewConfig: AgreementViewConfig
}

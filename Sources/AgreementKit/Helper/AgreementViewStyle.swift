//
//  AgreementViewStyle.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import UIKit

public enum AgreementViewStyle {
    case darkMode
    case lightMode
    public static func make(viewModel: AgreementViewModel,
                            config: AgreementViewConfig) -> AgreementViewProtocol {
        switch config.style {
        case .darkMode:
            return AgreementView_DarkMode(viewModel: viewModel,
                                      config: config)
        case .lightMode:
            return AgreementView_LightMode(viewModel: viewModel,
                                       config: config)
        }
    }
    
    public static func getViewConfigWithStyle(style: AgreementViewStyle, lang: String) -> AgreementViewConfig {
        switch style {
        case .darkMode:
            DarkModeAgreementViewConfig(lang: lang)
        case .lightMode:
            LightModeAgreementViewConfig(lang: lang)
        }
    }
}

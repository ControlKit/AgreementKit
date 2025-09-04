// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import UIKit
import Combine

public class AgreementKit {
    public init() {
    }
    
    @MainActor
    public func configure(root: UIViewController,
                          modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                          config: AgreementServiceConfig) async {
        Task {
            let viewModel = DefaultAgreementViewModel(serviceConfig: config)
            let agreementVC = AgreementViewController(
                viewModel: viewModel,
                config: config
            )
            agreementVC.modalPresentationStyle = modalPresentationStyle
            DispatchQueue.main.async {
                root.present(agreementVC, animated: true)
            }
        }
    }
}

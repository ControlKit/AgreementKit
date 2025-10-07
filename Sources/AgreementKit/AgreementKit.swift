// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import UIKit
import Combine
import ControlKitBase

public let agreementKit_Version: String = "1.0.0"
public class AgreementKit: Agreementable {
    public var agreementService: GenericServiceProtocol
    public init(agreementService: GenericServiceProtocol = GenericService()) {
        self.agreementService = agreementService
    }
    
    @MainActor
    public func configure(root: UIViewController,
                          modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                          config: AgreementServiceConfig) async {
        Task {
            let request = AgreementRequest(
                name: config.name,
                appId: config.appId,
                sdkVersion: config.sdkVersion
            )
            if let response = try await self.getAgreement(request: request)?.value {
                let viewModel = DefaultAgreementViewModel(
                    serviceConfig: config,
                    response: response
                )
                DispatchQueue.main.async {
                    let agreementVC = AgreementViewController(
                        viewModel: viewModel,
                        config: config
                    )
                    let navigationVontroller = UINavigationController(rootViewController: agreementVC)
                    navigationVontroller.modalPresentationStyle = modalPresentationStyle
                    DispatchQueue.main.async {
                        root.present(navigationVontroller, animated: true)
                    }
                }
            }
        }
    }
}

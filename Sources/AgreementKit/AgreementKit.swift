// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import UIKit
import Combine

public class AgreementKit: Agreementable {
    public var agreementService: AgreementServiceProtocol
    public init(agreementService: AgreementServiceProtocol = AgreementService()) {
        self.agreementService = agreementService
    }
    
    @MainActor
    public func configure(root: UIViewController,
                          modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                          config: AgreementServiceConfig) async {
        Task {
            let request = AgreementRequest(
                name: "Privacy Policy",
                appId: config.appId,
                route: config.route,
                sdkVersion: config.sdkVersion
            )
            if let response = try await self.getAgreement(request: request) {
                let viewModel = DefaultAgreementViewModel(response: response)
                if response.data != nil {
                    DispatchQueue.main.async {
                        let agreementView = AgreementViewStyle.make(
                            viewModel: viewModel,
                            config: config.viewConfig
                        )
                        let window = UIApplication.shared.windows.last!
                        agreementView.center.y += agreementView.frame.height
                        window.addSubview(agreementView)
                        agreementView.fixInView(window)
                        UIView.animate(withDuration: 1.0) {
                            agreementView.center.y -= agreementView.frame.height
                        }
                    }
                }
            }
        }
    }
}

//
//  AgreementViewController.swift
//  
//
//  Created by Maziar Saadatfar on 10/21/23.
//

import UIKit

class AgreementViewController: UIViewController {
    var viewModel: AgreementViewModel
    let config: AgreementServiceConfig

    init(viewModel: AgreementViewModel, config: AgreementServiceConfig) {
        self.viewModel = viewModel
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let AgreementView = AgreementViewStyle.make(viewModel: viewModel,
                                                    config: config.viewConfig)
        view.addSubview(AgreementView)
        AgreementView.fixInView(view)
        Task {
            viewModel.response = try await viewModel.agreementService.getAgreement(request: viewModel.request)
        }
    }
}

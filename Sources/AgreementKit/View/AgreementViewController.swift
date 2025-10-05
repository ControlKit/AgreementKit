//
//  AgreementViewController.swift
//  
//
//  Created by Maziar Saadatfar on 10/21/23.
//

import UIKit

class AgreementViewController: UIViewController, AgreementViewDelegate {
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
        let agreementView = AgreementViewStyle.make(viewModel: viewModel,
                                                    config: config.viewConfig)
        view.addSubview(agreementView)
        agreementView.delegate = self
        agreementView.fixInView(view)
        viewModel.viewAction()
    }
    
    func acceptAction() {
        viewModel.acceptAction()
        dismiss()
    }
    
    func declineAction() {
        viewModel.declineAction()
        dismiss()
    }
    
    func dismiss() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.dismiss(animated: true)
        }
    }
}

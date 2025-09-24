//
//  ViewActionable.swift
//  AgreementKit
//
//  Created by Maziar Saadatfar on 9/25/25.
//
public protocol DismissableDelegate: AnyObject {
    func dismiss()
}
public protocol ViewActionable: AgreementViewDelegate {
    var viewModel: AgreementViewModel { get set }
    var dismissDelegate: DismissableDelegate? { get set }
}
extension ViewActionable {
    func viewAction() {
        Task {
            let request = ActionRequest(agreemntId: viewModel.response.data.id, action: .view)
            try await viewModel.postAction(request: request)
        }
    }
    
    func acceptAction() {
        Task {
            let request = ActionRequest(agreemntId: viewModel.response.data.id, action: .accept)
            try await viewModel.postAction(request: request)
            dismissDelegate?.dismiss()
        }
    }
    
    func declineAction() {
        Task {
            let request = ActionRequest(agreemntId: viewModel.response.data.id, action: .decline)
            try await viewModel.postAction(request: request)
            dismissDelegate?.dismiss()
        }
    }
}

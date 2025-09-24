//
//  AgreementViewProtocol.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import UIKit

public protocol AgreementViewDelegate: AnyObject {
    func acceptAction()
    func declineAction()
}


public protocol AgreementViewProtocol: UIView {
    var delegate: AgreementViewDelegate? { get set }
}

public extension AgreementViewProtocol {
}

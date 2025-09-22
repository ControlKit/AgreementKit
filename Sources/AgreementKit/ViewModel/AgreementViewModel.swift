//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 9/29/23.
//
import Foundation
import UIKit

public protocol AgreementViewModel {
    var response: AgreementResponse { get set }
}

public final class DefaultAgreementViewModel: AgreementViewModel {
    public var response: AgreementResponse
    
    public init(response: AgreementResponse) {
        self.response = response
    }
}

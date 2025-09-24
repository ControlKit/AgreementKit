//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 9/29/23.
//
import Foundation
import UIKit

public protocol AgreementViewModel: Actionable {
    var response: AgreementResponse { get set }
    var actionService: ActionServiceProtocol { get set }
}

public final class DefaultAgreementViewModel: AgreementViewModel {
    public var actionService: ActionServiceProtocol
    public var response: AgreementResponse
    
    public init(
        response: AgreementResponse,
        actionService: ActionServiceProtocol = ActionService()
    ) {
        self.response = response
        self.actionService = actionService
    }
}

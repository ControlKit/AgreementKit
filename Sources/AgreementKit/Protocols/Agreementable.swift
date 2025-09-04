//
//  Agreementtable.swift
//
//
//  Created by Maziar Saadatfar on 10/11/23.
//

import Foundation

public protocol Agreementable: AnyObject {
    var agreementService: AgreementServiceProtocol { get set }
    func getAgreement(request: AgreementRequest) async throws -> AgreementResponse?
}

extension Agreementable {
    public func getAgreement(request: AgreementRequest) async throws -> AgreementResponse? {
        return try await agreementService.getAgreement(request: request)
    }
}

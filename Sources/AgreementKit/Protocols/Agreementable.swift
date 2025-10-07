//
//  Agreementtable.swift
//
//
//  Created by Maziar Saadatfar on 10/11/23.
//

import Foundation
import ControlKitBase
public protocol Agreementable: AnyObject {
    var agreementService: GenericServiceProtocol { get set }
    func getAgreement(request: AgreementRequest) async throws -> Result<AgreementResponse>?
}

extension Agreementable {
    public func getAgreement(request: AgreementRequest) async throws -> Result<AgreementResponse>? {
        return try await agreementService.execute(request: request)
    }
}

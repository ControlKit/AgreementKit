//
//  AgreementResponse.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation

public typealias AgreementLocalString = [AgreementLocalizedText]

public struct AgreementResponse: Codable {
    public var data: [AgreementModel]?
}
public struct AgreementModel: Codable {
    public let id: String
    public let agreementTitle: AgreementLocalString?
    public let termsTitle: AgreementLocalString?
    public let termsDescription: AgreementLocalString?
    public let acceptButtonTitle: AgreementLocalString?
    public let declineButtonTitle: AgreementLocalString?
    public let version: String?
    public let created_at: String?
}
public struct AgreementLocalizedText: Codable {
    public let language: String?
    public let content: String?
}

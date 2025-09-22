//
//  AgreementResponse.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation

public typealias AgreementLocalString = [AgreementLocalizedText]

public struct AgreementResponse: Codable {
    public var data: AgreementModel
}
public struct AgreementModel: Codable {
    public let id: String
    public let agreement_title: AgreementLocalString?
    public let title: AgreementLocalString?
    public let description: AgreementLocalString?
    public let accept_button_title: AgreementLocalString?
    public let decline_button_title: AgreementLocalString?
    public let version: Int?
    public let created_at: String?
}
public struct AgreementLocalizedText: Codable {
    public let language: String?
    public let content: String?
}

//
//  AgreementResponse.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import ControlKitBase

public struct AgreementResponse: Codable {
    public var data: AgreementModel
}
public struct AgreementModel: Codable {
    public let id: String
    public let agreement_title: LocalString?
    public let title: LocalString?
    public let description: LocalString?
    public let accept_button_title: LocalString?
    public let decline_button_title: LocalString?
    public let version: Int?
    public let created_at: String?
}

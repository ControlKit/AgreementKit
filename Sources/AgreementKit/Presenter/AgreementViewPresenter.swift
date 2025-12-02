//
//  AgreementPresenter.swift
//  AgreementKit
//
//  Created by Maziar Saadatfar on 8/26/25.
//
import Foundation
import ControlKitBase
public struct AgreementViewPresenter {
    var config: AgreementViewConfig
    public init(data: AgreementModel?, config: AgreementViewConfig) {
        self.config = config
        if let localTitle = data?.agreement_title,
            let title = getLocalizeString(localTitle) {
            self.config.agreement = title
        }
        if let localDescription = data?.description,
           let description = getLocalizeString(localDescription) {
            self.config.termsDescription = description
        }
        if let localTerms = data?.title,
           let terms = getLocalizeString(localTerms) {
            self.config.terms = terms
        }
        if let loaclAccept = data?.accept_button_title,
           let acceptButtonTitle = getLocalizeString(loaclAccept) {
            self.config.acceptButtonTitle = acceptButtonTitle
        }
        if let loaclDecline = data?.decline_button_title,
           let declineButtonTitle = getLocalizeString(loaclDecline) {
            self.config.declineButtonTitle = declineButtonTitle
        }
    }
    
    func getLocalizeString(_ localize: LocalString) -> String? {
        guard let localizeString = localize.first(where: { $0.language == config.lang.rawValue }) else {
            if let defaultLang = localize.first {
                return defaultLang.content
            } else {
                return nil
            }
        }
        return localizeString.content
    }
}

extension String {
    func formatDate() -> String {
       let dateFormatterGet = DateFormatter()
       dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-MM-dd  HH:mm"
       let dateObj: Date? = dateFormatterGet.date(from: self)

       return dateFormatter.string(from: dateObj!)
    }
    func formatDate2() -> String {
       let dateFormatterGet = DateFormatter()
       dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-MMM-dd"
       let dateObj: Date? = dateFormatterGet.date(from: self)

       return dateFormatter.string(from: dateObj!)
    }
}

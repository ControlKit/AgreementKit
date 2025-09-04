//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 10/18/23.
//

import Foundation
import UIKit
public class AgreementViewConfig {
    public init(lang: String) {
        self.lang = lang
    }
    
    public let lang: String
    public var style: AgreementViewStyle = .darkMode
    public var contentViewBackColor: UIColor = UIColor(r: 25, g: 29, b: 32, a: 1.0)
    
    public var agreementFont = UIFont.systemFont(ofSize: 18, weight: .heavy)
    public var agreement = "Agreement"
    public var agreementColor: UIColor = UIColor(r: 138, g: 141, b: 144)
    
    public var termsFont = UIFont.systemFont(ofSize: 24, weight: .semibold)
    public var terms = "Terms of Service"
    public var termsColor: UIColor = .white
    
    public var termsDescriptionFont = UIFont.systemFont(ofSize: 14, weight: .medium)
    public var termsDescriptionColor: UIColor = UIColor(r: 136, g: 136, b: 136)
    
    public var acceptButtonFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    public var acceptButtonTitle = "Accept"
    public var acceptButtonTitleColor: UIColor = .black
    public var acceptButtonBackColor: UIColor = .white
    public var acceptButtonRadius: CGFloat = 8.0
    public var acceptButtonBorderWidth: CGFloat = 1
    public var acceptButtonBorderColor: UIColor = .black
    
    public var declineButtonFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    public var declineButtonTitle = "Decline"
    public var declineButtonTitleColor: UIColor = .white
    public var declineButtonBorderColor: UIColor = .white
    public var declineButtonBackColor: UIColor = .clear
    public var declineButtonBorderWidth: CGFloat = 1.0
    public var declineButtonRadius: CGFloat = 8.0
    public var termsDescription = """
    1. Acceptance of Terms
    By downloading, accessing, or using [App Name], you agree to be bound by these Terms of Service and our Privacy Policy. If you do not agree, please do not use the app.

    2. Use of the App
    You must be at least 13 years old to use this app.

    You agree not to misuse the app or attempt to access it using methods other than the interface provided.

    You may not use the app for any unlawful or prohibited activity.

    3. User Accounts
    You are responsible for maintaining the confidentiality of your account credentials.

    You agree to notify us immediately of any unauthorized use of your account.

    4. Intellectual Property
    All content, trademarks, and code within the app are the property of [Company Name] or its licensors.

    You may not copy, modify, distribute, or reverse-engineer any part of the app.

    5. Privacy
    We respect your privacy. Please refer to our [Privacy Policy] for details on how we collect and use data.

    6. In-App Purchases
    Some features may require payment. All purchases are final and non-refundable unless required by law.

    7. Termination
    We reserve the right to suspend or terminate your access to the app at any time, without notice, for conduct that violates these terms.

    8. Limitation of Liability
    [Company Name] is not liable for any indirect, incidental, or consequential damages arising from your use of the app.

    9. Changes to Terms
    We may update these Terms from time to time. Continued use of the app after changes means you accept the new terms.

    10. Governing Law
    These Terms are governed by the laws of [Jurisdiction], without regard to conflict of law principles.
    """
}

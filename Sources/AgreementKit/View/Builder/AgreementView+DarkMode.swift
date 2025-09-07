//
//  File.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import UIKit

public protocol AgreementDelegate: AnyObject {
    func dismiss()
}

public class AgreementView_DarkMode: UIView, AgreementViewProtocol {
    var config: AgreementViewConfig
    var viewModel: AgreementViewModel
    
    weak public var delegate: AgreementDelegate?
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = config.contentViewBackColor
        return contentView
    }()
    lazy var agreementLabel: UILabel = {
        let label = UILabel()
        label.font = config.agreementFont
        label.text = config.agreement
        label.textColor = config.agreementColor
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    lazy var termsLabel: UILabel = {
        let label = UILabel()
        label.font = config.termsFont
        label.text = config.terms
        label.textColor = config.termsColor
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    lazy var descriptionView: UITextView = {
        let descriptionView = UITextView()
        descriptionView.isEditable = false
        descriptionView.font = config.termsDescriptionFont
        let options = [NSAttributedString.DocumentReadingOptionKey.documentType:
                        NSAttributedString.DocumentType.html]
        if config.termsDescription.starts(with: "<"),
           let data = config.termsDescription.data(using: String.Encoding.unicode,
                                                         allowLossyConversion: true) {
            if let attrStr = try? NSAttributedString(
                data: data,
                options: options,
                documentAttributes: nil) {
                descriptionView.attributedText = attrStr
            } else {
                descriptionView.text = config.termsDescription
            }
        } else {
            descriptionView.text = config.termsDescription
        }
        descriptionView.textColor = config.termsDescriptionColor
        descriptionView.textAlignment = .left
        descriptionView.backgroundColor = config.contentViewBackColor
        return descriptionView
    }()
    
    lazy var acceptButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = config.acceptButtonBackColor
        button.titleLabel?.textColor = config.acceptButtonTitleColor
        button.setTitle(config.acceptButtonTitle, for: .normal)
        button.setCurvedView(cornerRadius: config.acceptButtonRadius,
                             borderWidth: config.acceptButtonBorderWidth,
                             borderColor: config.acceptButtonBorderColor)
//        button.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        button.titleLabel?.font = config.acceptButtonFont
        button.setTitleColor(config.acceptButtonTitleColor, for: .normal)
        return button
    }()
    
    lazy var declineButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = config.declineButtonBackColor
        button.titleLabel?.textColor = config.declineButtonTitleColor
        button.setTitle(config.declineButtonTitle, for: .normal)
        button.setCurvedView(cornerRadius: config.declineButtonRadius,
                             borderWidth: config.declineButtonBorderWidth,
                             borderColor: config.declineButtonBorderColor)
//        button.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        button.titleLabel?.font = config.declineButtonFont
        button.setTitleColor(config.declineButtonTitleColor, for: .normal)
        return button
    }()
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public required init(viewModel: AgreementViewModel,
                         config: AgreementViewConfig) {
        self.config = config
        self.viewModel = viewModel
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func commonInit() {
        contentView.fixInView(self)
    }
    
    public func setup() {
        addSubview(contentView)
        contentView.fixInView(self)
        contentView.addSubview(agreementLabel)
        contentView.addSubview(termsLabel)
        contentView.addSubview(descriptionView)
        contentView.addSubview(acceptButton)
        contentView.addSubview(declineButton)
        commonInit()
        setAgreementViewConstraint()
        setTermsLabelConstraint()
        setTermsViewConstraint()
        setAcceptButtonConstraint()
        setDeclineButtonConstraint()
    }
    
    public func setAgreementViewConstraint() {
        agreementLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: agreementLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .top,
            multiplier: 1,
            constant: 80).isActive = true
        agreementLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        agreementLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
        NSLayoutConstraint(
            item: agreementLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 30).isActive = true
    }
    public func setTermsLabelConstraint() {
        agreementLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: termsLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: agreementLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 10).isActive = true
        termsLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        termsLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
        NSLayoutConstraint(
            item: termsLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 50).isActive = true
    }
    public func setTermsViewConstraint() {
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: descriptionView,
            attribute: .top,
            relatedBy: .equal,
            toItem: termsLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 50).isActive = true
        descriptionView.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        descriptionView.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
        NSLayoutConstraint(
            item: descriptionView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .bottom,
            multiplier: 1,
            constant: -120).isActive = true
    }
    public func setAcceptButtonConstraint() {
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: acceptButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: descriptionView,
            attribute: .bottom,
            multiplier: 1,
            constant: 10).isActive = true
        NSLayoutConstraint(
            item: acceptButton,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .bottom,
            multiplier: 1,
            constant: -50).isActive = true
        acceptButton.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
        NSLayoutConstraint(
            item: acceptButton,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 48).isActive = true
        NSLayoutConstraint(
            item: acceptButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 120).isActive = true
    }
    public func setDeclineButtonConstraint() {
        declineButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: declineButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: descriptionView,
            attribute: .bottom,
            multiplier: 1,
            constant: 10).isActive = true
        NSLayoutConstraint(
            item: declineButton,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .bottom,
            multiplier: 1,
            constant: -50).isActive = true
        declineButton.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        NSLayoutConstraint(
            item: declineButton,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 48).isActive = true
        NSLayoutConstraint(
            item: declineButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 120).isActive = true
    }
}

public class DarkModeAgreementViewConfig: AgreementViewConfig {
    public override init(lang: String) {
        super.init(lang: lang)
        style = .darkMode
    }
}

class ImageHelper {
    static var resolvedBundle: Bundle {
#if SWIFT_PACKAGE
        return Bundle.module
#else
        return Bundle(for: self)
#endif
    }
    
    static func image(_ name: String) -> UIImage? {
        return UIImage(named: name,
                       in: resolvedBundle,
                       compatibleWith: nil)
    }
}

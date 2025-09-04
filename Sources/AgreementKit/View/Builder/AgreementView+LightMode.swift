//
//  File.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//
import Foundation
import UIKit

public class AgreementView_LightMode: UIView, AgreementViewProtocol {
    var config: AgreementViewConfig
    var viewModel: AgreementViewModel
    
    weak public var delegate: AgreementDelegate?
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = config.contentViewBackColor
        return tableView
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
        tableView.fixInView(self)
    }
    
    public func setup() {
        addSubview(tableView)
        tableView.fixInView(self)
        commonInit()
    }
}

public class LightModeAgreementViewConfig: AgreementViewConfig {
    public override init(lang: String) {
        super.init(lang: lang)
        style = .darkMode
        acceptButtonBackColor = UIColor(r: 42, g: 111, b: 196)
        declineButtonBorderColor = UIColor(r: 173, g: 173, b: 173)
        termsDescriptionColor = UIColor(r: 147, g: 147, b: 147)
        termsColor = UIColor(r: 58, g: 112, b: 160)
        agreementColor = UIColor(r: 108, g: 108, b: 108)
        contentViewBackColor = .white
    }
}

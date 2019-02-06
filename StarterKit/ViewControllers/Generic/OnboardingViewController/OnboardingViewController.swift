//
//  OnboardingViewController.swift
//  StarterKit
//
//  Created by Devran Uenal on 06.02.19.
//  Copyright © 2019 Carl Zeiss AG. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    static let version = "0.1.1"
    
    var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.fillProportionally
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing = 16
        return stackView
    }()
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.white
        return scrollView
    }()
    
    var dismissButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.roundedRect)
        button.setTitle("Continue", for: UIControl.State.normal)
        button.setTitleColor(UIColor.zeiss.white, for: UIControl.State.normal)
        button.backgroundColor = UIColor.zeiss.cyan
        button.layer.cornerRadius = 8
        button.contentEdgeInsets = UIEdgeInsets(top: 14.0, left: 0, bottom: 15.0, right: 0)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        return button
    }()
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        title = NSLocalizedString("Welcome", comment: "")
        tabBarItem = UITabBarItem(title: title, image: UIImage(named: "Welcome"), selectedImage: UIImage(named: "Welcome"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dismissButton.addTarget(self, action: #selector(dismissAction(sender:)), for: UIControl.Event.touchUpInside)
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title1)
        titleLabel.text = "What’s New\nin StarterKit"
        titleLabel.numberOfLines = 0
        stackView.addArrangedSubview(titleLabel)
        
        let bodyLabel = UILabel()
        bodyLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        bodyLabel.numberOfLines = 0
        bodyLabel.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n\n"
        stackView.addArrangedSubview(bodyLabel)
        
        scrollView.addSubview(stackView)
        
        view.addSubview(scrollView)
        view.addSubview(dismissButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        view.layoutMarginsGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: dismissButton.bottomAnchor, multiplier: 1.0).isActive = true
        dismissButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.layoutMarginsGuide.leadingAnchor, multiplier: 1.0).isActive = true
        view.layoutMarginsGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: dismissButton.trailingAnchor, multiplier: 1.0).isActive = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        dismissButton.topAnchor.constraint(equalToSystemSpacingBelow: scrollView.bottomAnchor, multiplier: 2.0).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.readableContentGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.readableContentGuide.leadingAnchor).isActive = true
        scrollView.readableContentGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        
        stackView.widthAnchor.constraint(equalTo: view.readableContentGuide.widthAnchor).isActive = true
    }
    
    @objc func dismissAction(sender: UIButton) {
        UserDefaults.standard.set(OnboardingViewController.version, forKey: "OnboardingCompletedForVersion")
        dismiss(animated: true)
    }
}

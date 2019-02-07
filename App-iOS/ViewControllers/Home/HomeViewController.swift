//
//  HomeViewController.swift
//  StarterKit
//
//  Created by Devran Uenal on 05.02.19.
//  Copyright © 2019 Carl Zeiss AG. All rights reserved.
//

import UIKit
import WhatsNewKit

class HomeViewController: UIViewController {
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
        title = NSLocalizedString("Home", comment: "")
        tabBarItem = UITabBarItem(title: title, image: UIImage(named: "TabHome"), selectedImage: UIImage(named: "TabHome"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let whatsNewViewController = setupWhatsNewViewController() {
            self.present(whatsNewViewController, animated: true)
        }
    }
}

extension HomeViewController {
    func setupWhatsNewViewController() -> UIViewController? {
        let whatsNew = WhatsNew(
            title: "What's New in StarterKit",
            items: [
                WhatsNew.Item(
                    title: "App Icon Template",
                    subtitle: "Official App Icon Template included so you don't have to search it.",
                    image: UIImage(named: "WhatsNewIcon")
                ),
                WhatsNew.Item(
                    title: "Legal Text Templates",
                    subtitle: "Templates for Legal texts are displayed on the Information tab.",
                    image: UIImage(named: "WhatsNewLegal")
                ),
                WhatsNew.Item(
                    title: "Brand Colors",
                    subtitle: "All official ZEISS Brand Colors are available as Xcode Asset Catalog and properties of UIColor.zeiss.",
                    image: UIImage(named: "WhatsNewColors")
                ),
                WhatsNew.Item(
                    title: "Package Manager",
                    subtitle: "Carthage is included as the default Package Manager for iOS Frameworks.",
                    image: UIImage(named: "WhatsNewPackage")
                )
            ]
        )
        
        var configuration = WhatsNewViewController.Configuration()
        configuration.completionButton.titleFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        configuration.completionButton.backgroundColor = UIColor.Zeiss.Primary.cyan
        
        let keyValueVersionStore = KeyValueWhatsNewVersionStore(keyValueable: UserDefaults.standard)
        
        return WhatsNewViewController(whatsNew: whatsNew, configuration: configuration, versionStore: keyValueVersionStore)
    }
}

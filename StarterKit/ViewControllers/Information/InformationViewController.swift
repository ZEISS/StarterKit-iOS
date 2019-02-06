//
//  InformationViewController.swift
//  StarterKit
//
//  Created by Devran Uenal on 05.02.19.
//  Copyright © 2019 Carl Zeiss AG. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
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
        title = NSLocalizedString("Information", comment: "")
        tabBarItem = UITabBarItem(title: title, image: UIImage(named: "Information"), selectedImage: UIImage(named: "Information"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension InformationViewController {
    func informationData(for indexPath: IndexPath) -> InformationData {
        if indexPath.section == 0 {
            return InformationData.legalInformation[indexPath.row]
        } else {
            return InformationData.additionalInformation[indexPath.row]
        }
    }
}

extension InformationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return InformationData.legalInformation.count
        } else {
            return InformationData.additionalInformation.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let information = informationData(for: indexPath)
        let cell = UITableViewCell()
        cell.textLabel?.text = information.name
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension InformationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let information = InformationData.legalInformation[indexPath.row]
            let viewController = PageViewController(url: information.url, title: information.name)
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            let information = InformationData.additionalInformation[indexPath.row]
            let viewController = PageViewController(url: information.url, title: information.name)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

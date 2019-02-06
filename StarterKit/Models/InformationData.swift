//
//  InformationData.swift
//  StarterKit
//
//  Created by Kristof Dreier on 06.02.19.
//  Copyright © 2019 Carl Zeiss AG. All rights reserved.
//

import Foundation

struct InformationData {
    static var legalInformation: [InformationData] = [
        InformationData(name: NSLocalizedString("Licence", comment: ""), url: Bundle.main.url(forResource: "Licence", withExtension: "html")!),
        InformationData(name: NSLocalizedString("Data Protection", comment: ""), url: Bundle.main.url(forResource: "Data-Protection", withExtension: "html")!),
        InformationData(name: NSLocalizedString("Impressum", comment: ""), url: Bundle.main.url(forResource: "Impressum", withExtension: "html")!)
    ]
    
    static var additionalInformation: [InformationData] = [
        InformationData(name: NSLocalizedString("Legal Notices", comment: ""), url: Bundle.main.url(forResource: "Legal-Notices", withExtension: "html")!)
    ]
    
    var name: String
    var url: URL?
}

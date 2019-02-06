//
//  PageViewController+UIScrollViewDelegate.swift
//  StarterKit
//
//  Created by Devran Uenal on 06.02.19.
//  Copyright © 2019 Carl Zeiss AG. All rights reserved.
//

import UIKit

extension PageViewController: UIScrollViewDelegate {
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        scrollView.setContentOffset(.zero, animated: false)
    }
}

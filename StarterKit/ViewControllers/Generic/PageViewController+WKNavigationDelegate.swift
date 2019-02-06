//
//  PageViewController+WKNavigationDelegate.swift
//  StarterKit
//
//  Created by Devran Uenal on 06.02.19.
//  Copyright © 2019 Carl Zeiss AG. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

extension PageViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicatorView.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url, navigationAction.navigationType == .linkActivated {
            if url.absoluteString.hasPrefix("http") {
                let viewController = SFSafariViewController(url: url)
                present(viewController, animated: true)
            } else {
                UIApplication.shared.open(url)
            }
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }
}

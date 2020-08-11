//
//  WebViewController.swift
//  AliceInGambingland
//
//  Created by Max Khizhniakov on 05.08.2020.
//  Copyright © 2020 Max Khizhniakov. All rights reserved.
//

import UIKit
import WebKit
import FirebaseRemoteConfig

class WebViewController: UIViewController {
    // MARK: - Properties
    let remoteConfig = RemoteConfig.remoteConfig()
    var parameters: String?
    var url: String?
    
    // MARK: - UI
    lazy var webView: WKWebView = {
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        let view = WKWebView(frame: .zero, configuration: configuration)
        return view
    }()
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        setupWebView()
        
        setRemoteConfig()
        fetchRemoteConfig() { [weak self] in
            guard let self = self else { return }
            guard let url = self.url else { self.openURL(string: Constants.URLs.urlForAccess); print("parameters = \(self.parameters!)"); return }
            self.makeUrl(from: url) { [weak self] urlString in
                guard let self = self, let parameters = self.parameters else { return }
                //            self.openURL(string: self.parameters! + urlString)
                print("url = \(parameters)\(urlString)")
                self.openURL(string: Constants.URLs.urlForAccess)
            }
        }
    }
    
    // MARK: - Methods
    private func setRemoteConfig() {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }
    
    private func fetchRemoteConfig(completion: @escaping () -> Void) {
        remoteConfig.fetchAndActivate { [weak self] status, error in
            guard let self = self, error == nil else { return }
            self.parameters = self.remoteConfig.configValue(forKey: "url").stringValue
            completion()
        }
    }
    
    private func setupWebView() {
        let source = "function captureLog(msg) { window.webkit.messageHandlers.logHandler.postMessage(msg); } window.console.log = captureLog;"
        let script = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        webView.configuration.userContentController.addUserScript(script)
        webView.configuration.userContentController.add(self, name: "logHandler")
    }
    
    private func makeUrl(from string: String, completion: @escaping (String) -> Void) {
        let urlString = string.lowercased()
        if let bundleID = Bundle.main.bundleIdentifier {
            print("bundle", bundleID)
            if let range = urlString.range(of: bundleID.lowercased()) {
                print("range", range)
                if let range2 = urlString.range(of: "?") {
                    print("range2", range2)
                    var phone = urlString[range.upperBound...range2.lowerBound]
                    print(phone) // prints "123.456.7891"
                    phone.removeLast()
                    let split = String(phone).split(separator: "/")
                    var index = 1
                    var endUrl = ""
                    for item in split {
                        if index == split.count {
                            endUrl += "subid\(index)=" + item
                        } else {
                            endUrl += "subid\(index)=" + item + "&"
                            index += 1
                        }
                    }
                    print(endUrl)
                    completion(endUrl)
                } else {
                    let phone = urlString[range.upperBound...]
                    print(phone) // prints "123.456.7891"
                    let split = String(phone).split(separator: "/")
                    var index = 1
                    var endUrl = ""
                    for item in split {
                        if index == split.count {
                            endUrl += "subid\(index)=" + item
                        } else {
                            endUrl += "subid\(index)=" + item + "&"
                            index += 1
                        }
                    }
                    completion(endUrl)
                }
            }
        }
    }
    
    private func openURL(string: String) {
        guard let url = URL(string: string) else { return }
        let request = URLRequest(url: url)
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.webView.load(request)
        }
    }
}


// MARK: - Extensions
extension WebViewController: WKScriptMessageHandler, WKNavigationDelegate {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body)
        guard let string = message.body as? String else { return }
        
        if string == "user_accepted_action" {
            UserDefaults.standard.set(true, forKey: Constants.Keys.access)
            let chooseVC = ChooseViewController(viewModel: ChooseViewModel(),
                                                chooseColorView: ChooseColorView(),
                                                chooseDefendersView: ChooseDefendersView())
            chooseVC.modalPresentationStyle = .fullScreen
            
            self.present(chooseVC, animated: true, completion: nil)
        }
    }
}

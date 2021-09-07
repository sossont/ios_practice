//
//  WebView.swift
//  news swiftUI
//
//  Created by 정환우 on 2021/08/19.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    typealias UIViewType = WKWebView
    
    func makeUIView(context: Context) -> UIViewType {
        return WKWebView()
    }

    func updateUIView(_ uiView: UIViewType, context: Context){
        if let safeString = urlString {
            
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
            
        }
    }
    
}

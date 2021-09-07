//
//  DetailView.swift
//  news swiftUI
//
//  Created by 정환우 on 2021/08/19.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url:String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}

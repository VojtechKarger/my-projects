//
//  customViewsUIKIt.swift
//  customViewsUIKIt
//
//  Created by vojta on 18.09.2021.
//

import SwiftUI
import UIKit

struct UIKLabel: UIViewRepresentable {

    typealias TheUIView = UILabel
    var configuration = { (view: TheUIView) in }

    func makeUIView(context: UIViewRepresentableContext<Self>) -> TheUIView { TheUIView() }
    func updateUIView(_ uiView: TheUIView, context: UIViewRepresentableContext<Self>) {
        configuration(uiView)
    }
}

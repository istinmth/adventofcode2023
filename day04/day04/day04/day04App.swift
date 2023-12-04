//
//  day04App.swift
//  day04
//
//  Created by Istvan Akos Nemeth on 04/12/2023.
//

import SwiftUI

@main
struct day04App: App {
    var body: some Scene {
        DocumentGroup(newDocument: day04Document()) { file in
            ContentView(document: file.$document)
        }
    }
}

//
//  ContentView.swift
//  day04
//
//  Created by Istvan Akos Nemeth on 04/12/2023.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: day04Document

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(day04Document()))
}

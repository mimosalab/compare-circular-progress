//
//  ContentView.swift
//  CircularProgressBar
//
//  Created by Aravind Chowdary Kamani on 07/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 40) {
            CircularProgressView(progress: 0.5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

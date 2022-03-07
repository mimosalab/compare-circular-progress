//
//  CircularProgressView.swift
//  CircularProgressBar
//
//  Created by Aravind Chowdary Kamani on 07/03/22.
//

import SwiftUI

struct CircularProgressView: View {
    
    var progress = 10.0
    
    var body: some View {
      
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(
                    AngularGradient(
                        gradient: Gradient(
                            colors: [.blue, .green, .blue]),
                            center: .center
                        ),
                        style: StrokeStyle(lineWidth: 15.0,
                                           lineCap: .round,
                                           lineJoin: .round))
                .rotationEffect((Angle(degrees: 270)))
                .animation(.easeInOut(duration: 1.0), value: progress)
        }
        .frame(width: 250, height: 250)
        .padding()
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView()
    }
}

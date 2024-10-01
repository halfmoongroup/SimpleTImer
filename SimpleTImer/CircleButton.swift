//
//  CircleButton.swift
//  SimpleTImer
//
//  Created by tony giaccone on 3/22/24.
//

import SwiftUI

struct CircleButton: View {
   let title: String
   let size: CGFloat
    let textPoint = 14
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Circle()
                .stroke(.blue, lineWidth: 6)
                .padding(10)
            Text(title)
                .font(
                    .system(size: 24)
                    .weight(.bold))
                .foregroundColor(.white)
        }
        .frame(width: size, height: size)
    }
    
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(title: "1", size: 100.0)
    }
}

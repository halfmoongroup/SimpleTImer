//
//  TimerButton.swift
//  SimpleTImer
//
//  Created by tony giaccone on 3/24/24.
//

import SwiftUI

struct TimerButton: View {
    let time : Int
    var model : TimerModel
    
    var body: some View {
        Button (action: {
            model.minutes = time
            model.state = .active
        }) {
            ZStack {
                Text(String(time) )
                    .font(.system(size: 48))
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.black)
                    .clipShape(Circle())
                Circle()
                    .stroke(Color.blue, lineWidth:  5)
                    .frame(width:100, height:100)
            }
        }
    }
}

struct TimerButton_Previews: PreviewProvider {
    static var previews: some View {
        TimerButton(time: 1, model: TimerModel())
    }
}

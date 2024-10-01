//
//  TimerButton.swift
//  SimpleTImer
//
//  Created by tony giaccone on 3/24/24.
//

import SwiftUI

struct TimerButton: View {
    let time : Int
    @EnvironmentObject  var model : TimerModel
    
    var body: some View {
        Button (action: {
            model.minutes = time
            model.state = .active
            
            model.title = (time == 1) ? "\(time) Minute" : "\(time) Minutes" 
        }) {
            ZStack {
                Text(String(time) )
                    .font(.system(size: 54))
                    .frame(width: 115, height: 115)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
                Circle()
                    .stroke(Color.blue, lineWidth:  5)
                    .frame(width:115, height:115)
            }
        }
    }
}

struct TimerButton_Previews: PreviewProvider {
    static var previews: some View {
        TimerButton(time: 1)
    }
}

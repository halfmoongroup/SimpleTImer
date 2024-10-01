//
//  SimpleTimerView.swift
//  AlertView
//
//  Created by tony giaccone on 8/2/23.
//

import SwiftUI

struct SimpleTimerView: View {
    @EnvironmentObject var model : TimerModel
    var body: some View {
        VStack {
            ZStack {
                CircularProgressView(progress: $model.progress)
                    .padding(.top, 10)
                VStack {
                    Text("\(model.secondsToCompletion.asTimestamp)")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                        .padding([.top, .bottom], 10)
                    if (!model.title.isEmpty) {
                        Text(model.title)
                            .font(.system(size: 32))
                            .foregroundColor(.white)
                    }
                }
            }
            Divider()
            HStack {
                Button("Cancel") {
                    model.state = .cancelled
                    
                }
                .buttonStyle(CancelButtonStyle())
                Spacer()
                if (.cancelled == model.state) {
                    Button("Start") {
                        model.state = .active
                    }
                    .buttonStyle(StartButtonStyle())
                }
                if (.paused == model.state) {
                    Button("Resume") {
                        model.state = .resumed
                    }
                    .buttonStyle(PauseButtonStyle())
                }
                if (.active == model.state ||
                    .resumed == model.state ) {

                    Button("Pause") {
                        model.state = .paused
                    }
                    .buttonStyle(PauseButtonStyle())
                    
                }
                
            }
            .padding([.leading, .trailing], 20)
            .padding(.bottom, 10)

        }
        .frame(width: UIScreen.main.bounds.width-25, height: 400)
        .background(Color.black.opacity(0.85))
        .cornerRadius(12)
        .clipped()
    }
}

struct SimpleTimerView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTimerView()
        .environmentObject(TimerModel())
    }
}

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
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .padding([.top, .bottom], 10)
                    if (model.title.isEmpty) {
                        Text(model.title)
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
                switch model.state {
                case .cancelled:
                    Button("Start") {
                        model.state = .active
                    }
                    .buttonStyle(StartButtonStyle())
                case .paused:
                    Button("Resume") {
                        model.state = .resumed
                    }
                    .buttonStyle(PauseButtonStyle())
                case .active, .resumed:
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

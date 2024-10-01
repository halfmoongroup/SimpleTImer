//
//  Model.swift
//  SimpleTImer
//
//  Created by tony giaccone on 3/23/24.
//

import Foundation

enum TimerState: Int {
    case active = 1
    case paused
    case resumed
    case cancelled
    case finished
}

class TimerModel : ObservableObject  {
    @Published var minutes = 0
    @Published var displayTimer : Bool
    @Published var secondsToCompletion : Int
    @Published var countDownSeconds = 0
    @Published var progress: Float = 0.0
    @Published var title = ""
    
    private var timer : Timer?

    
    init() {
        displayTimer = false
        secondsToCompletion = 0
    }
    
    func pause() {
        timer!.invalidate()
    }
    
    @Published var state: TimerState = .cancelled {
        didSet {
            switch state {
            case .cancelled:
                timer!.invalidate()
                timer = nil
                secondsToCompletion = 0
                progress = 0
                displayTimer = false
            case .active:
                countDownSeconds = minutes * 60
                secondsToCompletion = countDownSeconds
                progress = 1.0
                displayTimer = true
                startTimer()

            case .paused:
                self.pause()

            case .resumed:
                startTimer()
                
                
            case .finished:
                timer!.invalidate();
                SoundPlayer.playAlarm()
                self.secondsToCompletion = 0
                self.progress = 1.0
                self.displayTimer = false
                
            }
        }
    }
    
    
    private func startTimer() {
        if timer != nil && timer!.isValid {
            timer!.invalidate()
        }
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
            guard let self else { return }

            self.secondsToCompletion -= 1
            self.progress = Float(self.secondsToCompletion) / Float(self.countDownSeconds)
    //        print("stc:\(secondsToCompletion) cds:\(countDownSeconds) prg:\(progress)" )
            // We can't do <= here because we need the time from T-1 seconds to
            // T-0 seconds to animate through first
            if ((self.secondsToCompletion < 0) && ((self.state == .active) || (self.state == .resumed))) {
                self.state = .finished
            }
        })
    }
}

extension Int {
    var asTimestamp: String {
        let minute = self / 60 % 60
        let second = self % 60

        return String(format: "%02i:%02i",  minute, second)
    }
}

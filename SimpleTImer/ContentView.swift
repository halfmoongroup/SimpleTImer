//
//  ContentView.swift
//  SimpleTImer
//
//  Created by tony giaccone on 3/22/24.
//

import SwiftUI
import CoreData
import os

struct ContentView: View {
    let logger = Logger()
    @State private var currentDate = Date.now
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var model : TimerModel
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeNow = "3:42 PM"
    //let dateFormatter = DateFormatter()
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            HStack {
                VStack {
                    Text(" \(timeNow)")
                        .font(.system(size: 53))
                        .foregroundColor(.white)
                        .onReceive(timer) {_ in
                            self.timeNow =  timeFormat.string(from: Date())
                         //   self.logger.info("tick \(timeNow) !")

                        }
                    if model.displayTimer {
                        SimpleTimerView()
                        Spacer()
                    }
                    else {
                        VStack(spacing:20) {
                            Text("Minutes")
                                .font(.system(size: 48))
                                .foregroundColor(.white)
                            
                            HStack(spacing:20) {
                                TimerButton(time: 1)
                                TimerButton(time: 2)
                            }
                            HStack(spacing:20) {
                                TimerButton(time: 3)
                                TimerButton(time:  5)
                            }
                            HStack(spacing:20) {
                                TimerButton(time: 10)
                                TimerButton(time: 15)
                            }
                            Spacer()
                        }
                        //.border(.blue)
                    }
                }
            }
        }
    }
    
    var timeFormat: DateFormatter {
        let formatter  = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter
    }
    
    func timeString(date: Date) -> String {
        let time = timeFormat.string(from:date)
        return time
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(TimerModel())

    }
}


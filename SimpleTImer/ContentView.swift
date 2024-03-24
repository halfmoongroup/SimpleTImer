//
//  ContentView.swift
//  SimpleTImer
//
//  Created by tony giaccone on 3/22/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var date = Date()
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var model : TimerModel
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        ZStack {
            
            HStack {
                VStack {
                    VStack(spacing:20) {
                        Text("\(timeString(date:date))")
                            .font(.system(size: 48))
                        
                        Text("Minutes")
                            .font(.system(size: 24))
                        
                        HStack(spacing:20) {
                            
                            
                            TimerButton(time: 1, model: model)
                            TimerButton(time: 2, model: model)
                            TimerButton(time: 3, model: model)
                            
                        }
                        HStack(spacing:20) {
                            
                            TimerButton(time:  5, model: model)
                            TimerButton(time: 10, model: model)
                            TimerButton(time: 15, model: model)
                            
                            
                        }
                        Spacer()
                        
                    }
                }
            }
            .blur(radius: model.displayTimer ? 30 : 0)
            if model.displayTimer {
                SimpleTimerView()
                Spacer()
            }
            
        }
    }
    
    var timeFormat: DateFormatter {
        let formatter  = DateFormatter()
        formatter.dateFormat = "hh:mm a"
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


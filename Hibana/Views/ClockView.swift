//
//  ClockView.swift
//  Hibana
//
//  Created by raku on 2020/10/05.
//

import SwiftUI

struct ClockView: View {
    @State var hour = Calendar.current.component(.hour, from: Date())
    @State var min = Calendar.current.component(.minute, from: Date())
    @State var sec = Calendar.current.component(.second, from: Date())
    
    
    
    
    
    @State var currentDate = Date()
    

    
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text("\(currentDate)")
            .onReceive(timer) { input in
                self.currentDate = input
            }
    }
    
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}

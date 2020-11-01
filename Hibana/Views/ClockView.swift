//
//  ClockView.swift
//  Hibana
//
//  Created by raku on 2020/10/05.
//

import SwiftUI

struct ClockView: View {
        @State var hour = Calendar.current.component(.hour, from: Date())
        @State var minute = Calendar.current.component(.minute, from: Date())
        @State var second = Calendar.current.component(.second, from: Date())
        
        var body: some View{
            
            Text("\(hour):\(minute):\(second)")
            .font(.title)
            
        }
    }

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}

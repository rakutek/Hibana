//
//  ContentView.swift
//  Hibana
//
//  Created by raku on 2020/10/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            ClockView()
            TimeTableView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

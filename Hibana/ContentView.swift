//
//  ContentView.swift
//  Hibana
//
//  Created by raku on 2020/10/29.
//

import SwiftUI


class DJ: ObservableObject {
    @Published var name = ["RAKU","TAISUKE"]
    @Published var start = ["2020-10-29T10:34:20Z","2020-10-29T12:00:00Z"]
    @Published var active = [true,true]
}

struct ContentView: View {
    var body: some View {
        VStack{
            ClockView()
                .padding()
            TimeTableView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

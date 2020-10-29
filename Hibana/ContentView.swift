//
//  ContentView.swift
//  Hibana
//
//  Created by raku on 2020/10/29.
//

import SwiftUI


class DJ: ObservableObject {
    @Published var djs = ["RAKU","TAISUKE"]
    @Published var start = ["2020-10-29T20:00:00Z","2020-10-29T20:30:00Z"]
}

struct ContentView: View {
    var body: some View {
        VStack{
            ClockView()
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

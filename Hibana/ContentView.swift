//
//  ContentView.swift
//  Hibana
//
//  Created by raku on 2020/10/29.
//

import SwiftUI

struct ContentView: View {
    
    let arr = ["VIZEL","CAMELOT","ATOM","EDGE HOUSE","TK","Beginning","DJMASAHIRO来日","ドラムン町内会"]
    
    var body: some View {
        NavigationView{
            
            VStack {
                
                ForEach(0..<arr.count) { num in
                
                NavigationLink(destination: TimeTableView()) {
                    Text(arr[num])
                }
                .foregroundColor(.primary)
                .font(.title)
                .padding()
                
                
                }
                
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

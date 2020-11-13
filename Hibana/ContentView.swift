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
        
        

        
        
        
        TabView {
            
            
            
            
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
            
            
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("イベント")
            }
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("お気に入り")
            }
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("DJ検索")
            }
        }
        .font(.headline)
    
        
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

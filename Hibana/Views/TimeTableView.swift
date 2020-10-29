//
//  TimeTableView.swift
//  Hibana
//
//  Created by raku on 2020/10/05.
//

import SwiftUI



struct TimeTableView: View {

    
    
    @ObservedObject var djs = DJ()
    
    var body: some View {
        
        
        
        
        VStack{
            
            
            
            ForEach(0..<djs.name.count) { num in
                if(self.djs.name[num] == ""){
                    
                }
                else {
                    HStack{
                        Text(self.djs.start[num])
                        Text(self.djs.name[num])
                    }
                    
                }
            }
            
            
            
        
        }

    }
}

struct TimeTableView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTableView()
    }
}

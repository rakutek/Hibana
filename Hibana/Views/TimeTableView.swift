//
//  TimeTableView.swift
//  Hibana
//
//  Created by raku on 2020/10/05.
//

import SwiftUI



struct TimeTableView: View {
    
    
    @ObservedObject var djs = DJ()
    
    
    func parseStringDate(str: String) -> Date {
        let formatter = DateFormatter()
        let localeStyle = Locale(identifier: "en_US_POSIX")
        formatter.locale = localeStyle
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return formatter.date(from: str)!
    }
    
    
    
    var body: some View {
        
        VStack{
            ForEach(0..<djs.name.count) { num in
//                if(self.djs.name[num] == ""){
                if(self.djs.active[num] == false){
                    
                }
                else {
                    HStack{
//                        TimerView(setDate: Date().addingTimeInterval(4))
                        TimerView(num: num, djs:djs)
                        
                        
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

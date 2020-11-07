//
//  TimeTableView.swift
//  Hibana
//
//  Created by raku on 2020/10/05.
//

import SwiftUI



struct TimeTableView: View {
    
    
    @ObservedObject var djs = DJ()
    
    @State var show = false
    
    let DJMock: [DJModel] = [
        DJModel(id: 1, name: "RAKU", sex: "men", start: "2020-11-08T04:13:40Z", active: true),
        DJModel(id: 1, name: "MASAHIRO", sex: "men", start: "2020-11-08T04:13:40Z", active: true)

    
    ]
    
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
            ForEach(0..<djs.name.count) { num in                if(self.djs.active[num] == false){
                    
                }
                else {
                    
                    
                    Button(action: {self.show = true}, label: {
                        HStack{
                            //TimerView(setDate:Date().addingTimeInterval(4))
                            Spacer()
                            TimerView(num: num, djs:djs)
                            Spacer()

                            Text(self.djs.name[num])
                                .font(.title)
                            Spacer()
                        }
                    })
                    .foregroundColor(.primary)
                    .sheet(isPresented: self.$show) {
                        DJDetail()
                    }
                    
                    
                    
                }
            }
            
        }
        
    }
}

struct DJDetail: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TimeTableView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTableView()
    }
}

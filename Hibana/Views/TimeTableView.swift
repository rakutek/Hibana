//
//  TimeTableView.swift
//  Hibana
//
//  Created by raku on 2020/10/05.
//

import SwiftUI

class DJ : ObservableObject {
    @Published var DJMock: [DJModel] = [
        DJModel(id: 1, name: "TAISUKE", sex: "men", start: "2020-11-08T08:13:40Z", active: true,description:"ヤッホ〜〜〜TAISUKE"),
        DJModel(id: 2, name: "MASAHIRO", sex: "men", start: "2020-11-08T04:13:40Z", active: true,description:"ヤッホ〜〜〜masahiro")
    ]
}


struct TimeTableView: View {
    @ObservedObject var djs = DJ()
    @State var show = false
    
    
    func parseStringDate(str: String) -> Date {
        let formatter = DateFormatter()
        let localeStyle = Locale(identifier: "en_US_POSIX")
        formatter.locale = localeStyle
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return formatter.date(from: str)!
    }
    
    var body: some View {
        
        
        NavigationView {
            VStack{
                ForEach(0..<djs.DJMock.count) { num in
                    if(self.djs.DJMock[num].active == false){
                    } else {
                        NavigationLink(destination: DJDetail(dj:self.djs, num:num) ) {
                            HStack{
                                //TimerView(setDate:Date().addingTimeInterval(4))
                                Image(djs.DJMock[num].name)
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 60, height: 60, alignment: .center)
                                Spacer()
                                TimerView(num: num, djs:djs)
                                Spacer()
                                
                                Text(self.djs.DJMock[num].name)
                                    .font(.title)
                                Spacer()
                            }
                            .foregroundColor(.primary)
                            
                        }
                    }
                }
            }
        }
    }
}

struct DJDetail: View {
    @ObservedObject var dj:DJ
    let num:Int
    
    var body: some View {
        Text("\(num)")
        Text(dj.DJMock[num].description)
    }
}

struct TimeTableView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTableView()
    }
}

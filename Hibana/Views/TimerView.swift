import SwiftUI

struct TimerView : View {
    
    func parseStringDate(str: String) -> Date {
        let formatter = DateFormatter()
        let localeStyle = Locale(identifier: "ja_JP")
        formatter.locale = localeStyle
        formatter.timeZone = TimeZone(secondsFromGMT: 32400) //日本時間に合わせてる
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return formatter.date(from: str)!
    }
    
    @State var nowD:Date = Date()
    let num:Int
    @ObservedObject var djs: DJ
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowD = Date()
        }
    }
    
    var body: some View {
        
        Text(TimerFunc(from: parseStringDate(str: djs.DJMock[num].start)))
            .font(.largeTitle)
            .onAppear(perform: {
                _ = self.timer
            })
    }
    
    func TimerFunc(from date:Date)->String{
        let cal = Calendar(identifier: .japanese)
        
        let timeVal = cal.dateComponents([.day,.hour,.minute,.second], from: nowD,to: parseStringDate(str: djs.DJMock[num].start) )
        
        if timeVal.day! >= 1 {
            return String(format: "%02d:%02d:%02d",
                          
                          timeVal.day ?? 00,
                          timeVal.hour ?? 00,
                          timeVal.minute ?? 00)
            
        } else {
            if(timeVal.hour == 0 && timeVal.minute == 0 && timeVal.second==0){
                djs.DJMock[num].active = false
            }
            
//            return String(format: "%02d:%02d:%02d",
//                          timeVal.hour ?? 00,
//                          timeVal.minute ?? 00,
//                          timeVal.second ?? 00
//            )
            
            let s:String = String(format: "%02d:%02d:%02d",
                       timeVal.hour ?? 00,
                       timeVal.minute ?? 00,
                       timeVal.second ?? 00
                    )
            
//            if s.contains("-") { // -> true
//                djs.DJMock[num].active = false
//            }
            
            return s
            
            
        }
        
    }
    
}


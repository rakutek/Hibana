import SwiftUI

struct TimerView : View {
    
    func parseStringDate(str: String) -> Date {
        let formatter = DateFormatter()
        let localeStyle = Locale(identifier: "en_US_POSIX")
        formatter.locale = localeStyle
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return formatter.date(from: str)!
    }
    
  @State var nowD:Date = Date()
    let num:Int
    
//    @ObservedObject var djs = DJ()
    @ObservedObject var djs: DJ
    
   var timer: Timer {
       Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
           self.nowD = Date()
       }
   }
   
   var body: some View {
        
       Text(TimerFunc(from: parseStringDate(str: djs.start[num])))
           .font(.largeTitle)
           .onAppear(perform: {
                          _ = self.timer
                      })
}

   func TimerFunc(from date:Date)->String{
       let cal = Calendar(identifier: .japanese)

    let timeVal = cal.dateComponents([.day,.hour,.minute,.second], from: nowD,to: parseStringDate(str: djs.start[num]) )
    
    if timeVal.day! >= 1 {
        return String(format: "%02d:%02d:%02d",
                      
        timeVal.day ?? 00,
        timeVal.hour ?? 00,
        timeVal.minute ?? 00)
        
    } else {
        if(timeVal.hour == 0 && timeVal.minute == 0 && timeVal.second==0){
//            return String("fa")
            djs.active[num] = false
//            djs.name[0] = "f"
            
        }
        
        return String(format: "%02d:%02d:%02d",
                      
        
        timeVal.hour ?? 00,
        timeVal.minute ?? 00,
        timeVal.second ?? 00
        )
    }
       
   }
   
}


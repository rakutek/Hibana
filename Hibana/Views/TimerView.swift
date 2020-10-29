import SwiftUI

struct TimerView : View {
  @State var nowD:Date = Date()
   let setDate:Date
    
//    @ObservedObject var djs = DJ()
    @ObservedObject var djs: DJ
    
   var timer: Timer {
       Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
           self.nowD = Date()
       }
   }
   
   var body: some View {
        
       Text(TimerFunc(from: setDate))
           .font(.largeTitle)
           .onAppear(perform: {
                          _ = self.timer
                      })
}

   func TimerFunc(from date:Date)->String{
       let cal = Calendar(identifier: .japanese)

       let timeVal = cal.dateComponents([.day,.hour,.minute,.second], from: nowD,to: setDate)
    
    if timeVal.day! >= 1 {
        return String(format: "%02d:%02d:%02d",
                      
        timeVal.day ?? 00,
        timeVal.hour ?? 00,
        timeVal.minute ?? 00)
        
    } else {
        if(timeVal.hour == 0 && timeVal.minute == 0 && timeVal.second==0){
//            return String("fa")
            djs.active[0] = false
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


//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerView(setDate:  Date().addingTimeInterval(5))
//
//
//    }
//}

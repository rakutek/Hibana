import SwiftUI

struct ClockView: View {
    @State var hour = Calendar.current.component(.hour, from: Date())
    @State var minute = Calendar.current.component(.minute, from: Date())
    @State var second = Calendar.current.component(.second, from: Date())
    
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    var body: some View {
        Text("\(hour):\(second):\(second)")
            .font(.largeTitle)
            .onReceive(timer){ _ in
                       self.hour = Calendar.current.component(.hour, from: Date())
                       self.minute = Calendar.current.component(.minute, from: Date())
                       self.second = Calendar.current.component(.second, from: Date())
                   }
    }
    
}




struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}

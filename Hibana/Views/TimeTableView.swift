import SwiftUI

class DJ : ObservableObject {
    @Published var DJMock: [DJModel] = [
        DJModel(id: 1, name: "TAISUKE", sex: "men", start: "2020-11-09T17:09:30Z", active: true,description:"ヤッホ〜〜〜TAISUKE",genre:["EDM","HIP HOP","BASS"]),
        
        DJModel(id: 2, name: "MASAHIRO", sex: "men", start: "2020-11-08T17:28:20Z", active: true,description:"ヤッホ〜〜〜masahiro",genre:["EDM","HIP HOP","BASS","TRANCE"])
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
        
            VStack{
                ForEach(0..<djs.DJMock.count) { num in

                    
                    if(self.djs.DJMock[num].active == false){
                    } else {
                        
                        NavigationLink(destination: DJDetailView(dj:self.djs, num:num) ) {
                            HStack{
                                Spacer()
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


struct TimeTableView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTableView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}

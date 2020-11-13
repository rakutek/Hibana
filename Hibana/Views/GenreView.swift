//
//  GenreView.swift
//  Hibana
//
//  Created by raku on 2020/11/13.
//

import SwiftUI

struct GenreView: View {
    @State var genre:String
    @ObservedObject var djs = DJ()
    
    var body: some View {
        
        VStack{
            ForEach(0..<djs.DJMock.count) { num in
                
                
                
                NavigationLink(destination: DJDetailView(dj:self.djs, num:num) ) {
                    HStack{
                        Spacer()
                        //TimerView(setDate:Date().addingTimeInterval(4))
                        Image(djs.DJMock[num].name)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 60, height: 60, alignment: .center)
                            
                            //                                Spacer()
                            .padding()
                        
                        VStack {
                            Text(self.djs.DJMock[num].name)
                                .font(.largeTitle)
                            
                            HStack {
                                ForEach(0..<djs.DJMock[num].genre.count) { n in
                                    Text(djs.DJMock[num].genre[n])
                                }
                            }
                
                            
                        }
                        
                        
                        
                        
                        Spacer()
                    }
                    .foregroundColor(.primary)
                    
                }
            }
            
        }
    }
    
    
    
    
}

struct GenreView_Previews: PreviewProvider {
    static var previews: some View {
        GenreView(genre: "edm")
    }
}

//
//  DJDetailView.swift
//  Hibana
//
//  Created by raku on 2020/11/13.
//

import SwiftUI

struct DJDetailView: View {
    @ObservedObject var dj:DJ
    let num:Int
    
    var body: some View {
        
        VStack{
            
            Image(dj.DJMock[num].name)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 100, height: 100, alignment: .center)
            
            HStack{
                ForEach(0..<dj.DJMock[num].genre.count) { n in
                    Text(dj.DJMock[num].genre[n])
                }
            }
            .padding()
            
            Text(dj.DJMock[num].description)
        }
    }
}

struct DJDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DJDetailView(dj: DJ(), num: 0)
    }
}

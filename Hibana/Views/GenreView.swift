//
//  GenreView.swift
//  Hibana
//
//  Created by raku on 2020/11/13.
//

import SwiftUI

struct GenreView: View {
    @State var genre:String
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text(genre+"のDJたちがずらり")
        
    }
}

struct GenreView_Previews: PreviewProvider {
    static var previews: some View {
        GenreView(genre: "edm")
    }
}

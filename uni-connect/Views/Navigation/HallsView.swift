//
//  HallsView.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-07.
//

import SwiftUI

struct HallsView: View {
    
    var items = Array(1...30).map { "Item \($0)" }
    
    let columns = [
         GridItem(.flexible()),
         GridItem(.flexible())
    ]
    
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(items, id: \.self) { item in
                                LocationTile()
                            }
                        }
                        .padding()
        }
    }
}

#Preview {
    HallsView()
}

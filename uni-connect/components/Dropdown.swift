//
//  Dropdown.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-07.
//

import SwiftUI

struct CustomDropDown: View {
    
    @Binding var selectedOption : String
    
    let options: [String]
    let icon: String
    let title: String

    
    var body: some View {
        
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .padding(.leading, 8)

            Menu {
                ForEach(options, id: \.self) { option in
                    Button(option) {
                        selectedOption = option
         
                    }
                }
            } label: {
                HStack {
                    Text(
                        selectedOption.isEmpty
                        ? (title.isEmpty ? "Select an option" : title)
                        : selectedOption
                    ).foregroundColor(.black)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 12)
                .frame(maxWidth: .infinity, minHeight: 40, alignment: .center)
                .background(Color.white)
                .cornerRadius(8)
            }
            .padding(.leading, 4)

        }
        .background(Color.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        
    }
}

#Preview {
    CustomDropDown(selectedOption: .constant("Hello"), options: ["Hello","Hi"], icon: "map", title: "Hello")
}

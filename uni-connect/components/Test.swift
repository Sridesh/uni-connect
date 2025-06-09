//
//  Test.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-09.
//

import SwiftUI

struct ConfirmEraseItems: View {
    @State private var showSheet = false
        @State private var isOn = false

        var body: some View {
            VStack {
                Button("Show Toggle Sheet") {
                    showSheet = true
                }
            }
            .sheet(isPresented: $showSheet) {
                VStack {
                    Text("Settings")
                        .font(.headline)
                        .padding()

                    Toggle("Enable Feature", isOn: $isOn)
                        .padding()

                    Button("Done") {
                        showSheet = false
                    }
                    .padding(.top, 20)

                    Spacer()
                }
                .padding()
                .presentationDetents([.height(250)]) // Optional: mimic action sheet height
            }
        }
}

#Preview {
    ConfirmEraseItems()
}


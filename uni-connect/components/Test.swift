import SwiftUI

struct ClickableImageHotspots: View {
    var body: some View {
        ZStack {
            // Your base image
            Image("hall1") // Replace with your image name
                .resizable()
                .scaledToFit()

            // Example hotspot #1
            Circle()
                .fill(Color.red.opacity(0.7))
                .frame(width: 30, height: 30)
                .position(x: 100, y: 150) // Coordinates relative to the image
                .onTapGesture {
                    print("Hotspot 1 tapped")
                    // Trigger action here
                }

            // Example hotspot #2
            Circle()
                .fill(Color.blue.opacity(0.7))
                .frame(width: 30, height: 30)
                .position(x: 200, y: 300)
                .onTapGesture {
                    print("Hotspot 2 tapped")
                    // Another action
                }
        }
    }
}

#Preview {
    ClickableImageHotspots()
}

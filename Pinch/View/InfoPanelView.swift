//
//  InfoPanelView.swift
//  Pinch
//  This view represents the information panel in the app.
//  Created by Arjun Prabhune on 8/15/23.
//

import SwiftUI

struct InfoPanelView: View {
    // Properties that store the current scale and offset of an image.
    var scale: CGFloat
    var offset: CGSize
    
    // State property to toggle the visibility of the information panel.
    @State private var isInfoPanelVisible: Bool = false
    
    var body: some View {
        HStack { // Horizontal stack to arrange child views horizontally.
            
            // MARK: - HOTSPOT
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical) // Uses hierarchical color for the symbol.
                .resizable() // Makes the image resizable.
                .frame(width: 30, height: 30) // Explicitly sets the image's frame dimensions.
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.easeOut) { // Animate the visibility toggle.
                        isInfoPanelVisible.toggle() // Toggles the visibility of the info panel.
                    }
                }
            
            Spacer() // Empty space to separate views.
            
            // MARK: - INFO PANEL
            HStack(spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)") // Displays the scale value.
                
                Spacer() // Empty space to separate views.
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)") // Displays the horizontal offset.
                
                Spacer() // Empty space to separate views.
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)") // Displays the vertical offset.
                
                Spacer()
            }
            .font(.footnote) // Sets the font size of the text.
            .padding(8) // Adds padding around the HStack.
            .background(.ultraThinMaterial) // Sets an ultra-thin material background.
            .cornerRadius(8) // Rounds the corners of the HStack.
            .frame(maxWidth: 420) // Limits the maximum width of the HStack.
            .opacity(isInfoPanelVisible ? 1 : 0) // Sets the opacity based on the info panel's visibility.
            
            Spacer() // Empty space to separate views.
        }
    }
}

// This struct provides a preview of the InfoPanelView in Xcode's canvas.
struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(scale: 1, offset: .zero)
            .preferredColorScheme(.dark) // Sets a dark color scheme for the preview.
            .previewLayout(.sizeThatFits) // Uses a layout that fits the content size for the preview.
            .padding() // Adds padding around the preview.
    }
}

@_private(sourceFile: "InfoPanelView.swift") import Pinch
import SwiftUI
import SwiftUI

extension InfoPanelView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/arjunprabhune/SwiftTraining/Pinch/Pinch/View/InfoPanelView.swift", line: 65)
        InfoPanelView(scale: __designTimeInteger("#22249.[2].[0].property.[0].[0].arg[0].value", fallback: 1), offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    
#sourceLocation()
    }
}

extension InfoPanelView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/arjunprabhune/SwiftTraining/Pinch/Pinch/View/InfoPanelView.swift", line: 18)
        HStack {
            // MARK: - HOTSPOT
            Image(systemName: __designTimeString("#22249.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "circle.circle"))
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: __designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 30), height: __designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[0].modifier[2].arg[1].value", fallback: 30))
                .onLongPressGesture(minimumDuration: __designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[0].modifier[3].arg[0].value", fallback: 1)) {
                    withAnimation(.easeOut) {
                        isInfoPanelVisible.toggle()
                    }
                }
            
            Spacer()
            
            
            // MARK: - INFO PANEL
            HStack(spacing: __designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[0].value", fallback: 2)) {
                Image(systemName: __designTimeString("#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[0].arg[0].value", fallback: "arrow.up.left.and.arrow.down.right"))
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: __designTimeString("#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[3].arg[0].value", fallback: "arrow.left.and.right"))
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: __designTimeString("#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[6].arg[0].value", fallback: "arrow.up.and.down"))
                Text("\(offset.height)")
                
                Spacer()
            }
            .font(.footnote)
            .padding(__designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[2].modifier[1].arg[0].value", fallback: 8))
            .background(.ultraThinMaterial)
            .cornerRadius(__designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[2].modifier[3].arg[0].value", fallback: 8))
            .frame(maxWidth: __designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[2].modifier[4].arg[0].value", fallback: 420))
            .opacity(isInfoPanelVisible ? __designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[2].modifier[5].arg[0].value.then", fallback: 1) : __designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[2].modifier[5].arg[0].value.else", fallback: 0))
            
            Spacer()
            
        }
    
#sourceLocation()
    }
}

import struct Pinch.InfoPanelView
import struct Pinch.InfoPanelView_Previews


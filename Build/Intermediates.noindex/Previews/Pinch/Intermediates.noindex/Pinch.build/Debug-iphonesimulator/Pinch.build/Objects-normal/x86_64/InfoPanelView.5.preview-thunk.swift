@_private(sourceFile: "InfoPanelView.swift") import Pinch
import SwiftUI
import SwiftUI

extension InfoPanelView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/arjunprabhune/SwiftTraining/Pinch/Pinch/View/InfoPanelView.swift", line: 65)
        __designTimeSelection(InfoPanelView(scale: __designTimeInteger("#22249.[2].[0].property.[0].[0].arg[0].value", fallback: 1), offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding(), "#22249.[2].[0].property.[0].[0]")
    
#sourceLocation()
    }
}

extension InfoPanelView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/arjunprabhune/SwiftTraining/Pinch/Pinch/View/InfoPanelView.swift", line: 18)
        __designTimeSelection(HStack {
            // MARK: - HOTSPOT
            __designTimeSelection(Image(systemName: __designTimeString("#22249.[1].[3].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "circle.circle"))
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: __designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[0].modifier[2].arg[0].value", fallback: 30), height: __designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[0].modifier[2].arg[1].value", fallback: 30))
                .onLongPressGesture(minimumDuration: __designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[0].modifier[3].arg[0].value", fallback: 1)) {
                    __designTimeSelection(withAnimation(.easeOut) {
                        __designTimeSelection(isInfoPanelVisible.toggle(), "#22249.[1].[3].property.[0].[0].arg[0].value.[0].modifier[3].arg[1].value.[0].arg[1].value.[0]")
                    }, "#22249.[1].[3].property.[0].[0].arg[0].value.[0].modifier[3].arg[1].value.[0]")
                }, "#22249.[1].[3].property.[0].[0].arg[0].value.[0]")
            
            __designTimeSelection(Spacer(), "#22249.[1].[3].property.[0].[0].arg[0].value.[1]")
            
            
            // MARK: - INFO PANEL
            __designTimeSelection(HStack(spacing: __designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[0].value", fallback: 2)) {
                __designTimeSelection(Image(systemName: __designTimeString("#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[0].arg[0].value", fallback: "arrow.up.left.and.arrow.down.right")), "#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[0]")
                __designTimeSelection(Text("\(__designTimeSelection(scale, "#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[1].arg[0].value.[1].value.arg[0].value"))"), "#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[1]")
                
                __designTimeSelection(Spacer(), "#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[2]")
                
                __designTimeSelection(Image(systemName: __designTimeString("#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[3].arg[0].value", fallback: "arrow.left.and.right")), "#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[3]")
                __designTimeSelection(Text("\(__designTimeSelection(offset.width, "#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[4].arg[0].value.[1].value.arg[0].value"))"), "#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[4]")
                
                __designTimeSelection(Spacer(), "#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[5]")
                
                __designTimeSelection(Image(systemName: __designTimeString("#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[6].arg[0].value", fallback: "arrow.up.and.down")), "#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[6]")
                __designTimeSelection(Text("\(__designTimeSelection(offset.height, "#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[7].arg[0].value.[1].value.arg[0].value"))"), "#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[7]")
                
                __designTimeSelection(Spacer(), "#22249.[1].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[8]")
            }
            .font(.footnote)
            .padding(__designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[2].modifier[1].arg[0].value", fallback: 8))
            .background(.ultraThinMaterial)
            .cornerRadius(__designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[2].modifier[3].arg[0].value", fallback: 8))
            .frame(maxWidth: __designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[2].modifier[4].arg[0].value", fallback: 420))
            .opacity(__designTimeSelection(isInfoPanelVisible, "#22249.[1].[3].property.[0].[0].arg[0].value.[2].modifier[5].arg[0].value.if") ? __designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[2].modifier[5].arg[0].value.then", fallback: 1) : __designTimeInteger("#22249.[1].[3].property.[0].[0].arg[0].value.[2].modifier[5].arg[0].value.else", fallback: 0)), "#22249.[1].[3].property.[0].[0].arg[0].value.[2]")
            
            __designTimeSelection(Spacer(), "#22249.[1].[3].property.[0].[0].arg[0].value.[3]")
            
        }, "#22249.[1].[3].property.[0].[0]")
    
#sourceLocation()
    }
}

import struct Pinch.InfoPanelView
import struct Pinch.InfoPanelView_Previews


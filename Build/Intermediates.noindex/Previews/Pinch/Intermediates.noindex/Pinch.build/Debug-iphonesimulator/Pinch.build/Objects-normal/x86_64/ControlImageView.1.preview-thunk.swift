@_private(sourceFile: "ControlImageView.swift") import Pinch
import SwiftUI
import SwiftUI

extension ControlImageView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/arjunprabhune/SwiftTraining/Pinch/Pinch/View/ControlImageView.swift", line: 21)
        ControlImageView(icon: __designTimeString("#29947.[2].[0].property.[0].[0].arg[0].value", fallback: "minus.magnifyingglass"))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    
#sourceLocation()
    }
}

extension ControlImageView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/arjunprabhune/SwiftTraining/Pinch/Pinch/View/ControlImageView.swift", line: 14)
        Image(systemName: icon)
            .font(.system(size: __designTimeInteger("#29947.[1].[1].property.[0].[0].modifier[0].arg[0].value.arg[0].value", fallback: 36)))
    
#sourceLocation()
    }
}

import struct Pinch.ControlImageView
import struct Pinch.ControlImageView_Previews


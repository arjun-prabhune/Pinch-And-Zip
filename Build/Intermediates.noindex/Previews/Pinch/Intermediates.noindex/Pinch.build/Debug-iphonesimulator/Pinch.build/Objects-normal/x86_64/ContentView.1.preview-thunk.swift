@_private(sourceFile: "ContentView.swift") import Pinch
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/arjunprabhune/SwiftTraining/Pinch/Pinch/Screen/ContentView.swift", line: 200)
        ContentView()
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/arjunprabhune/SwiftTraining/Pinch/Pinch/Screen/ContentView.swift", line: 30)
        NavigationView {
            ZStack {
                Color.clear
                // MARK: - PAGE IMAGE
                Image(__designTimeString("#15030.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value", fallback: "magazine-front-cover")) // creates image and makes it fit in borders
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(__designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[2].arg[0].value", fallback: 10))
                    .padding()
                    .shadow(color: .black.opacity(__designTimeFloat("#15030.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[4].arg[0].value.modifier[0].arg[0].value", fallback: 0.2)), radius: __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[4].arg[1].value", fallback: 12), x:__designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[4].arg[2].value", fallback: 2), y:__designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[4].arg[3].value", fallback: 2))
                    .opacity(isAnimating ? __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[5].arg[0].value.then", fallback: 1) : __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[5].arg[0].value.else", fallback: 0)) //if isAnimating is true, 1 if it is false, 0
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                // MARK: - TAP GESTURE
                    .onTapGesture (count: __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[8].arg[0].value", fallback: 2), perform: {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[8].arg[1].value.[0].[0].[0].arg[1].value.[0].[0]", fallback: 5)
                            }
                        } else {
                            resetImageState()
                        }
                    })
                
                // MARK: - 2. Drag Gesture
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[9].arg[0].value.modifier[0].arg[0].value.[0].arg[0].value.arg[0].value", fallback: 1))) {
                                    imageOffset = value.translation
                                }
                            }
                            .onEnded { _ in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )
                
                
                // MARK: - 3. Magnification
                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[10].arg[0].value.modifier[0].arg[0].value.[0].arg[0].value.arg[0].value", fallback: 1))) {
                                    if imageScale >= 1 && imageScale <= 5 {
                                        imageScale = value
                                    } else if imageScale > 5 {
                                        imageScale = __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[10].arg[0].value.modifier[0].arg[0].value.[0].arg[1].value.[0].[1].[0].[0]", fallback: 5)
                                    }
                                }
                            }
                            .onEnded { _ in
                                if imageScale > 5 {
                                    imageScale = __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].modifier[10].arg[0].value.modifier[1].arg[0].value.[0].[0].[0].[0]", fallback: 5)
                                } else if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                        
                    )
                
            } //: ZSTACK
            .navigationTitle(__designTimeString("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: "Pinch & Zoom"))
            .navigationBarTitleDisplayMode(.inline) // centers the title
            .onAppear(perform: {
                withAnimation(.linear(duration: __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[2].arg[0].value.[0].arg[0].value.arg[0].value", fallback: 1))) {
                    isAnimating = true
                }
                
            })
          
          // MARK: - INFO PANEL
            .overlay(
            InfoPanelView(scale: imageScale, offset: imageOffset)
                .padding(.horizontal)
                .padding(.top, __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[3].arg[0].value.modifier[1].arg[1].value", fallback: 30))
            ,
            alignment: .top
            )
            //overlay puts the info panel icon and view at the top of the screen
            
            // MARK: - CONTROLS
            .overlay(
                Group {
                    HStack {
                        // SCALE DOWN: makes the image smaller each time the button is clicked
                        Button {
                            withAnimation(.spring()) {
                                if imageScale > 1 {
                                    imageScale -= __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].[0].[0].[0]", fallback: 1)
                                    
                                    if imageScale <= 1 {
                                        resetImageState()
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(icon: __designTimeString("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "minus.magnifyingglass"))
                        }
                        
                        // RESET: Resets the image to original size
                        Button {
                            resetImageState()
                        } label: {
                            ControlImageView(icon: __designTimeString("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "arrow.up.left.and.down.right.magnifyingglass"))
                        }
                        
                        // SCALE UP: makes image bigger each time it is clicked
                        Button {
                            withAnimation(.spring()) {
                                if imageScale < 5 {
                                    imageScale += __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].[0].[0].[0]", fallback: 1)
                                    
                                    if imageScale > 5 {
                                        imageScale = __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].arg[0].value.[2].arg[0].value.[0].arg[1].value.[0].[0].[1].[0].[0].[0]", fallback: 5)
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(icon: __designTimeString("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].arg[0].value.[2].arg[1].value.[0].arg[0].value", fallback: "plus.magnifyingglass"))
                        }
                        
                    } //: CONTROLS
                    .padding(EdgeInsets(top: __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].modifier[0].arg[0].value.arg[0].value", fallback: 12), leading: __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].modifier[0].arg[0].value.arg[1].value", fallback: 20), bottom: __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].modifier[0].arg[0].value.arg[2].value", fallback: 12), trailing: __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].modifier[0].arg[0].value.arg[3].value", fallback: 20)))
                    .background(.ultraThinMaterial)
                    .cornerRadius(__designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].modifier[2].arg[0].value", fallback: 12))
                    .opacity(isAnimating ? __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].modifier[3].arg[0].value.then", fallback: 1) : __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value.arg[0].value.[0].modifier[3].arg[0].value.else", fallback: 0))
                }
                    .padding(.bottom, __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[4].arg[0].value.modifier[0].arg[1].value", fallback: 30))
                , alignment: .bottom
            
            )
            
            // MARK: - DRAWER
            .overlay(
                HStack (spacing: __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[5].arg[0].value.arg[0].value", fallback: 12)) {
                    // MARK: - Drawer Handle
                    Image(systemName: isDrawerOpen ? __designTimeString("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[5].arg[0].value.arg[1].value.[0].arg[0].value.then", fallback: "chevron.compact.left"): __designTimeString("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[5].arg[0].value.arg[1].value.[0].arg[0].value.else", fallback: "chevron.compact.left"))
                        .resizable()
                        .scaledToFit()
                        .frame(height: __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[5].arg[0].value.arg[1].value.[0].modifier[2].arg[0].value", fallback: 40))
                        .padding(__designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[5].arg[0].value.arg[1].value.[0].modifier[3].arg[0].value", fallback: 8))
                        .foregroundStyle(.secondary)
                        .onTapGesture(perform: {
                            withAnimation(.easeOut) {
                                isDrawerOpen.toggle()
                            }
                        })
                    
                    // MARK: - THUMBNAILS
                    Spacer()
                } //: DRAWER
                    .padding(EdgeInsets(top: __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[5].arg[0].value.modifier[0].arg[0].value.arg[0].value", fallback: 16), leading: __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[5].arg[0].value.modifier[0].arg[0].value.arg[1].value", fallback: 8), bottom: __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[5].arg[0].value.modifier[0].arg[0].value.arg[2].value", fallback: 16), trailing: __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[5].arg[0].value.modifier[0].arg[0].value.arg[3].value", fallback: 8)))
                    .background(.ultraThinMaterial)
                    .cornerRadius(__designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[5].arg[0].value.modifier[2].arg[0].value", fallback: 12))
                    .opacity(isAnimating ? __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[5].arg[0].value.modifier[3].arg[0].value.then", fallback: 1) : __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[5].arg[0].value.modifier[3].arg[0].value.else", fallback: 0))
                    .frame(width: __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[5].arg[0].value.modifier[4].arg[0].value", fallback: 260))
                    .padding(.top, UIScreen.main.bounds.height / __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[5].arg[0].value.modifier[5].arg[1].value.[0]", fallback: 12))
                    .offset(x: isDrawerOpen ? __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[5].arg[0].value.modifier[6].arg[0].value.then", fallback: 20) : __designTimeInteger("#15030.[1].[5].property.[0].[0].arg[0].value.[0].modifier[5].arg[0].value.modifier[6].arg[0].value.else", fallback: 215))
                , alignment: .topTrailing
            )
            
        } //: NAVIGATION
        .navigationViewStyle(.stack) // stack navigation style will avoid using the sidebar
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: resetImageState()) private func __preview__resetImageState() {
        #sourceLocation(file: "/Users/arjunprabhune/SwiftTraining/Pinch/Pinch/Screen/ContentView.swift", line: 20)
        return withAnimation(.spring()) {
            imageScale = __designTimeInteger("#15030.[1].[4].[0].arg[1].value.[0].[0]", fallback: 1)
            imageOffset = .zero
        }
    
#sourceLocation()
    }
}

import struct Pinch.ContentView
import struct Pinch.ContentView_Previews


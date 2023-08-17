//
// ContentView.swift
// This is the main content view for the "Pinch" app.
//

import SwiftUI

// Define the main content view structure.
struct ContentView: View {
    
    // MARK: - PROPERTY
    
    // State variables to manage animation, image properties, and the drawer status.
    @State private var isAnimating: Bool = false // Track animation state.
    @State private var imageScale: CGFloat = 1   // Track scale/zoom level of the image.
    @State private var imageOffset: CGSize = .zero  // Track the image's offset position.
    @State private var isDrawerOpen: Bool = false   // Track drawer's visibility.

    // Array of 'Page' objects, initialized with data from 'pagesData'.
    let pages: [Page] = pagesData
    @State private var pageIndex: Int = 1   // Track the current page index.
    
    // MARK: - FUNCTION
    
    // Reset the image to its original state.
    func resetImageState() {
        return withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    // Get the current page's image name.
    func currentPage() -> String {
        return pages[pageIndex - 1].ImageName
    }
    
    // MARK: - CONTENT
    
    // The main body view definition.
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear  // Clear background for the ZStack.
                
                // MARK: - PAGE IMAGE
                // Display the current page's image.
                Image(currentPage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)  // Fit the image within its container.
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x:2, y:2) // Apply shadow to the image.
                    .opacity(isAnimating ? 1 : 0) // Control image opacity based on animation state.
                    .offset(x: imageOffset.width, y: imageOffset.height) // Apply the offset.
                    .scaleEffect(imageScale) // Apply the scaling.
                
                // MARK: - TAP GESTURE
                // Double tap to zoom the image.
                .onTapGesture (count: 2, perform: {
                    if imageScale == 1 {
                        withAnimation(.spring()) {
                            imageScale = 5
                        }
                    } else {
                        resetImageState()
                    }
                })
                
                // MARK: - 2. Drag Gesture
                // Drag gesture to move the image.
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.linear(duration: 1)) {
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
                // Pinch to zoom gesture.
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            withAnimation(.linear(duration: 1)) {
                                if imageScale >= 1 && imageScale <= 5 {
                                    imageScale = value
                                } else if imageScale > 5 {
                                    imageScale = 5
                                }
                            }
                        }
                        .onEnded { _ in
                            if imageScale > 5 {
                                imageScale = 5
                            } else if imageScale <= 1 {
                                resetImageState()
                            }
                        }
                )
                
            } //: ZSTACK
            
            // Navigation details.
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline) // Center the navigation title.
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
                
            })
          
          // MARK: - INFO PANEL
            // Overlay the Info Panel view on top of the main content.
            .overlay(
            InfoPanelView(scale: imageScale, offset: imageOffset)
                .padding(.horizontal)
                .padding(.top, 30)
            ,
            alignment: .top
            )
            
            // MARK: - CONTROLS
            // Overlay the zoom controls (plus, minus, reset) on the bottom.
            .overlay(
                Group {
                    HStack {
                        // Button to scale down the image.
                        Button {
                            withAnimation(.spring()) {
                                if imageScale > 1 {
                                    imageScale -= 1
                                    
                                    if imageScale <= 1 {
                                        resetImageState()
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                        }
                        
                        // Button to reset the image to its original size and position.
                        Button {
                            resetImageState()
                        } label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        
                        // Button to scale up the image.
                        Button {
                            withAnimation(.spring()) {
                                if imageScale < 5 {
                                    imageScale += 1
                                    
                                    if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                        }
                        
                    } //: CONTROLS
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                }
                .padding(.bottom, 30)
                , alignment: .bottom
            )
            
            // MARK: - DRAWER
            // Overlay the thumbnail drawer on the top right.
            .overlay(
                HStack (spacing: 12) {
                    // Button to toggle the thumbnail drawer.
                    Image(systemName: isDrawerOpen ? "chevron.compact.right": "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(8)
                        .foregroundStyle(.secondary)
                        .onTapGesture(perform: {
                            withAnimation(.easeOut) {
                                isDrawerOpen.toggle()
                            }
                        })
                    
                    // Thumbnails for all pages.
                    ForEach(pages) { item in
                        Image(item.thumbnailName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                            .opacity(isDrawerOpen ? 1 : 0)
                            .animation(.easeOut(duration: 0.5), value: isDrawerOpen)
                            .onTapGesture(perform: {
                                isAnimating = true
                                pageIndex = item.id
                            })
                    }
                    
                    
                    Spacer() // Fill the remaining space.
                } //: DRAWER
                .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                .opacity(isAnimating ? 1 : 0)
                .frame(width: 260)
                .padding(.top, UIScreen.main.bounds.height / 12)
                .offset(x: isDrawerOpen ? 20 : 215)
                , alignment: .topTrailing
            )
            
        } //: NAVIGATION
        .navigationViewStyle(.stack) // Use stack style navigation to avoid a sidebar layout.
    }
}

// Preview the content view.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

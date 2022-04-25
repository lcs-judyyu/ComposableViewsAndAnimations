//
//  ExerciseTwoView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseTwoView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
    
    // Controls the size
    @State private var scaleFactor: CGFloat = 1.0
    
    // Controls the hue
    @State private var color: Color = .red
    
    // Controls the position
    @State private var offset: CGFloat = 0
    
    // Whether to apply the animation
    @State private var useAnimation = false
    
    @State private var expandOrShrink: CGFloat = 0.0
    
    // MARK: Computed properties
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(color)
                    .scaleEffect(scaleFactor)
                    .offset(x: 0, y: offset)
                    .onTapGesture {
                        // Change the color to a random color
                        color = Color(hue: Double.random(in: 1...360) / 360.0,
                                      saturation: 0.8,
                                      brightness: 0.8)
                        
                        //animation change in position and size
                        withAnimation(.easeIn(duration: 1)) {
                            
                            expandOrShrink += 0.1
                            
                            if expandOrShrink <= 1 {
                                
                                //expand and move up
                                scaleFactor += 0.1
                                offset += 20
                                
                            } else if expandOrShrink <= 2 {
                                
                                //shrink and move down
                                scaleFactor -= 0.1
                                offset -= 20
                                
                            } else {
                                
                                expandOrShrink = 0
                                scaleFactor -= 0.1
                                offset -= 20
                            }
                        }
                    }
                
                Spacer()
                
            }
            .navigationTitle("Exercise 2")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                    }
                }
            }
            
        }
        
    }
    
    // MARK: Functions
    
    // Makes this view go away
    func hideView() {
        showThisView = false
    }
    
}

struct ExerciseTwoView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseTwoView(showThisView: .constant(true))
    }
}

//
//  ExerciseThreeView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseThreeView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
    
    // Controls what typeface the text is shown in
    @State private var typeFace: String = "Helvetica-Neue"
    
    // Whether to apply the animation
    @State private var useAnimation = false
    
    // How much to rotate the text
    @State private var rotationAmount = 0.0
    
    @State private var phase: CGFloat = 0
    
    // MARK: Computed properties

    private static let fontNames: [String] = {
        var names: [String] = []
        for familyName in UIFont.familyNames {
            names.append(contentsOf: UIFont.fontNames(forFamilyName: familyName))
        }
        return names.sorted()
    }()
    
    var body: some View {
        
        NavigationView {
            
            VStack {

                    Text("Good work!")
                        .padding()
                        .font(.custom(typeFace, size: 30.0))
                        .overlay(
                            Rectangle()
                                .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10], dashPhase: phase))
                                //.frame(width: 300, height: 70)
                                .onAppear { self.phase -= 20 }
                                .animation(Animation.linear.repeatForever(autoreverses: false))
                        )
                        .rotation3DEffect(.degrees(rotationAmount), axis: (x: 0,
                                                                           y: 1,
                                                                           z: 0))
                        .onTapGesture {
                            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                                rotationAmount += 30.0
                            }
                            //typeFace = ExerciseThreeView.fontNames.randomElement()!
                        }
                        .shadow(color: .red, radius: 3, x: 20, y: 20)
                
            }
            .navigationTitle("Exercise 3")
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

struct ExerciseThreeView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseThreeView(showThisView: .constant(true))
    }
}

//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    
    //MARK: Stored Properties
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    // What is loading?
    let message: String
    
    //controls position
    @State var topAndRightOffset: CGFloat = 100
    @State var bottomAndLeftOffset: CGFloat = -100
    
    //controls size
    @State var scaleFactor: CGFloat = 1
    
    //controls rotation degree
    @State var rotationDegree: CGFloat = 0
    
    //controls text
    @State var textVersion: CGFloat = 1
    
    //MARK: Computed Properties
    
    var body: some View {
        
        VStack (spacing: 130) {
            
            ZStack {
                
                //top
                Circle()
                    .fill(Color("aquamarine"))
                    .frame(width: 70, height: 70)
                    .scaleEffect(scaleFactor)
                    .offset(x: 0, y: topAndRightOffset)

                //right
                Circle()
                    .fill(Color("salmon"))
                    .frame(width: 70, height: 70)
                    .scaleEffect(scaleFactor)
                    .offset(x: topAndRightOffset, y: 0)

                //bottom
                Circle()
                    .fill(Color("champagne"))
                    .frame(width: 70, height: 70)
                    .scaleEffect(scaleFactor)
                    .offset(x: 0, y: bottomAndLeftOffset)
   
                //left
                Circle()
                    .fill(Color("cherokee"))
                    .frame(width: 70, height: 70)
                    .scaleEffect(scaleFactor)
                    .offset(x: bottomAndLeftOffset, y: 0)
 
            }
            .rotationEffect(.degrees(rotationDegree))
            .onReceive(timer) { input in
                
                withAnimation(
                    Animation.easeInOut(duration: 0.4)
                        .repeatForever(autoreverses: true)
                ) {
                    //change position
                    topAndRightOffset = 40
                    bottomAndLeftOffset = -40
                    
                    //change size
                    scaleFactor = 0.6
                    
                    //rotate
                    rotationDegree += 30
                }
                
            }
            
            //text
            HStack (spacing: 6) {
                Text("Loading " + "\(message)")
                    .italic()
                    .bold()
                    .opacity(1)
                
                Text(" .")
                    .italic()
                    .bold()
                    .opacity(textVersion == 1 ? 1 : 0)
                
                Text(" .")
                    .italic()
                    .bold()
                    .opacity(textVersion == 2 ? 1 : 0)
                
                Text(" .")
                    .italic()
                    .bold()
                    .opacity(textVersion == 3 ? 1 : 0)
                
            }
            .font(.title2)
            .foregroundColor(Color.gray)
            .onReceive(timer) { input in
                
                withAnimation(
                    Animation.linear(duration: 0.4)
                ) {
                    
                    if textVersion == 3 {
                        textVersion = 1
                    } else {
                        textVersion += 1
                    }
                }

            }
        }
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView(message: "images")
    }
}

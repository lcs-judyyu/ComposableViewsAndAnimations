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
    
    //controls position
    @State var topAndRightOffset: CGFloat = 100
    @State var bottomAndLeftOffset: CGFloat = -100
    
    //controls size
    @State var scaleFactor: CGFloat = 1
    
    //controls rotation degree
    @State var rotationDegree: CGFloat = 0
    
    //MARK: Computed Properties
    
    var body: some View {
        
        VStack (spacing: 130) {
            
            ZStack {
                
                //top
                Circle()
                    .fill(Color.blue)
                    .frame(width: 70, height: 70)
                    .scaleEffect(scaleFactor)
                    .offset(x: 0, y: topAndRightOffset)
                    .opacity(0.7)

                //right
                Circle()
                    .fill(Color.blue)
                    .frame(width: 70, height: 70)
                    .scaleEffect(scaleFactor)
                    .offset(x: topAndRightOffset, y: 0)
                    .opacity(0.7)

                //bottom
                Circle()
                    .fill(Color.blue)
                    .frame(width: 70, height: 70)
                    .scaleEffect(scaleFactor)
                    .offset(x: 0, y: bottomAndLeftOffset)
                    .opacity(0.7)
   
                //left
                Circle()
                    .fill(Color.blue)
                    .frame(width: 70, height: 70)
                    .scaleEffect(scaleFactor)
                    .offset(x: bottomAndLeftOffset, y: 0)
                    .opacity(0.7)
 
            }
            .rotationEffect(.degrees(rotationDegree))
            .onReceive(timer) { input in
                
                withAnimation(
                    Animation.easeInOut(duration: 0.4)
                        .repeatForever(autoreverses: true)
                ) {
                    topAndRightOffset = 40
                    bottomAndLeftOffset = -40
                    scaleFactor = 0.6
                    rotationDegree += 30
                }
                //timer.upstream.connect().cancel()
            }
            
            //text
            ZStack {
                Text("Loading .")
                    .italic()
                    .bold()
                    .opacity(0)
                
                Text("Loading . .")
                    .italic()
                    .bold()
                    .opacity(0)
                
                Text("Loading . . .")
                    .italic()
                    .bold()
                    .opacity(1)
                
            }
            .font(.title2)
            .foregroundColor(Color.gray)
        }
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}

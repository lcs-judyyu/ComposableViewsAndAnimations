//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    
    //MARK: Stored Properties
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    //controls position
    @State var topAndRightOffset: CGFloat = 100
    @State var bottomAndLeftOffset: CGFloat = -100
    
    //MARK: Computed Properties
    
    var body: some View {
        
        VStack (spacing: 140) {
            
            ZStack {
                
                //top
                Circle()
                    .fill(Color.blue)
                    .frame(width: 60, height: 60)
                    .offset(x: 0, y: topAndRightOffset)
                    .opacity(0.7)

                //right
                Circle()
                    .fill(Color.blue)
                    .frame(width: 60, height: 60)
                    .offset(x: topAndRightOffset, y: 0)
                    .opacity(0.7)

                //bottom
                Circle()
                    .fill(Color.blue)
                    .frame(width: 60, height: 60)
                    .offset(x: 0, y: bottomAndLeftOffset)
                    .opacity(0.7)
   
                //left
                Circle()
                    .fill(Color.blue)
                    .frame(width: 60, height: 60)
                    .offset(x: bottomAndLeftOffset, y: 0)
                    .opacity(0.7)
 
            }
            .onReceive(timer) { input in
                
                withAnimation(
                    Animation.easeInOut(duration: 0.5)
                        .repeatForever(autoreverses: true)
                ) {
                    topAndRightOffset = 50
                    bottomAndLeftOffset = -50
                }
                
                //timer.upstream.connect().cancel()
            }
            
            //text
            Text("Loading...")
                .foregroundColor(Color.gray)
                .italic()
                .bold()
        }
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}

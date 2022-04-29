//
//  SecondCustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Judy Yu on 2022-04-28.
//

import SwiftUI

struct SecondCustomComposableView: View {
    
    //MARK: Stored Properties
    @Environment(\.scenePhase) var scenePhase
    
    let timer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()
    
    // What is the color?
    let color: String
    
    //controls position
    @State var offset: CGFloat = 0
    
    //controls first push
    @State var firstPush = Int.random(in: 1...66)
    
    //controls second push
    @State var secondPush = Int.random(in: 1...32)
    
    //controls last push
    let lastPush: Int = 1
    
    //keep track of current progress
    @State var progress = 0
    
    //controls opacity of the progress bar
    @State var opacityAmount: CGFloat = 0
    
    //controls x offset of the progress bar
    @State var xOffset: CGFloat = -310
    
    //controls first interval between rounded rectangles
    let firstInterval: CGFloat = -30
    
    //controls spacings between rounded rectangles
    let interval: CGFloat = -18
    
    //controls height of the outer rounded rectangle
    let outerHeight: CGFloat = 35
    
    //MARK: Computed Properties
    //controls third push
    var thirdPush: Int {
        99 - firstPush - secondPush
    }
    
    var body: some View {
        VStack (spacing: 20) {
            
            //progress bar
            ZStack {
                
                //outer background
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .frame(width: 310, height: outerHeight)
                
                ZStack {
                    //from right to left
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 70, height: outerHeight)
                        .foregroundColor(Color("\(color)"))
                        .offset(x: 120)
                    
                    ForEach([0.0,1.0,3.0,4.0,6.0,7.0,9.0,10.0,12.0], id: \.self) {
                        
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .frame(width: 70, height: outerHeight)
                            .foregroundColor($0.truncatingRemainder(dividingBy: 3) == 0 ? Color.white : Color("\(color)"))
                            .offset(x: 120 + firstInterval + $0 * interval)
                    }
                    
                    //end
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 47, height: outerHeight)
                        .foregroundColor(Color("\(color)"))
                        .offset(x: -133)
                }
                .offset(x: xOffset)
                .opacity(opacityAmount)
                .onReceive(timer) { input in
                    
                    opacityAmount = 1
                    
                    withAnimation(
                        Animation.easeInOut(duration: 1.1)
                    ) {
                        xOffset += CGFloat(firstPush) * 3.1
                        progress += firstPush
                    }
                    
                    withAnimation(
                        Animation.easeInOut(duration: 1.1).delay(1.7)
                    ) {
                        xOffset += CGFloat(secondPush) * 3.1
                        progress += secondPush
                    }
                    
                    withAnimation(
                        Animation.easeInOut(duration: 1.1).delay(3.5)
                    ) {
                        xOffset += CGFloat(thirdPush) * 3.1
                        progress += thirdPush
                    }
                    
                    withAnimation(
                        Animation.easeInOut(duration: 1.1).delay(5.5)
                    ) {
                        xOffset += CGFloat(lastPush) * 3.1
                        progress += lastPush
                    }
                    
                    // Stop the timer
                    timer.upstream.connect().cancel()
                }
               
                HStack {
                    //hide the progress bar
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 50, height: outerHeight)
                    
                    Spacer()
                }
                
            }
            
            ZStack {
                Text("Completed!")
                    .opacity(progress == 100 ? 1 : 0)
                
                Text("Almost Ready ...")
                    .opacity(progress >= 60 && progress < 100 ? 1 : 0)
                
                Text("Loading ...")
                    .opacity(progress < 60 ? 1 : 0)
            }
            .font(Font.custom("TimesNewRomanPS-BoldItalicMT", size: 30))
            .foregroundColor(Color.gray)
            
        }
        .onDisappear {
            opacityAmount = 0
        }
        .onChange(of: scenePhase) { phase in
            opacityAmount = 0
        }

    }

}

struct SecondCustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        SecondCustomComposableView(color: "eggplant")
    }
}

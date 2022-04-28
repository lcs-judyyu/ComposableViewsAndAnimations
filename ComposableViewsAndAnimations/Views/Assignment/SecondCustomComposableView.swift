//
//  SecondCustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Judy Yu on 2022-04-28.
//

import SwiftUI
struct Intervals: Hashable, Identifiable {
    let id: UUID
    let numberOfIntervals: [CGFloat] =  [0.0,1.0,3.0,4.0,6.0,7.0,9.0,10.0,12.0]
}

struct SecondCustomComposableView: View {
    
    //MARK: Stored Properties
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
        VStack (spacing: 50) {
            
            HStack {
                Image(systemName: "bubble.left").scaleEffect(2.5)
                Image(systemName: "drop").scaleEffect(2.5).rotationEffect(.degrees(180))
                Text("50%")
            }
            
            //progress bar
            ZStack {
                
                HStack {
                    //hide the progress bar
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 50, height: outerHeight)
                    
                    Spacer()
                }
                
                //outer background
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .frame(width: 310, height: outerHeight)
                
                ZStack {
                    //from right to left
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 70, height: outerHeight)
                        .foregroundColor(Color("aquamarine"))
                        .offset(x: 120)
                    
                    ForEach([0.0,1.0,3.0,4.0,6.0,7.0,9.0,10.0,12.0], id: \.self) {
                        
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .frame(width: 70, height: outerHeight)
                            .foregroundColor($0.truncatingRemainder(dividingBy: 3) == 0 ? Color.white : Color("aquamarine"))
                            .offset(x: 120 + firstInterval + $0 * interval)
                    }
                    
                    //end
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 47, height: outerHeight)
                        .foregroundColor(Color("aquamarine"))
                        .offset(x: -133)
                }
                .offset(x: -310)
                .opacity(1)
                
            }
            
            ZStack {
                Text("Completed!")
                    .opacity(progress == 100 ? 1 : 0)
          
                Text("Almost Ready...")
                    .opacity(progress >= 60 ? 1 : 0)
           
                Text("Loading...")
                    .opacity(progress < 60 ? 1 : 0)
            }
            
        }
    }
}

struct SecondCustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        SecondCustomComposableView(color: "pink")
    }
}

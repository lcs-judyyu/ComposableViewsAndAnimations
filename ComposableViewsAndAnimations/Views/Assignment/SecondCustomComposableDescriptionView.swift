//
//  SecondCustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Judy Yu on 2022-04-28.
//

import SwiftUI

struct SecondCustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    @State private var colorChoice: String = "salmon"
    
    //possible colors
    var colors = ["aquamarine", "cherokee", "champagne", "salmon"]
    
    // MARK: Computed properties
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Group {
                
                Text("Description")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                Text("""
                        Replace this with a description of how to use this view.
                        If the view accepts a parameter, provide a control to enter the input below.
                        """)
                
                //let user pick a color
                Picker(selection: $colorChoice,
                       label: Text("Color Picker"),
                       content: {
                    
                    ForEach(colors, id: \.self, content: { color in
                        
                        HStack (spacing: 10) {
                            
                            Text(color)
                            
                            //square to display the color
                            Rectangle()
                                .frame(width: 12, height: 12, alignment: .center)
                                .foregroundColor(Color("\(color)"))
                            
                        }
  
                                   })
                    
                })
                .font(.title)
                .pickerStyle(WheelPickerStyle())
                
            }
            .padding(.bottom)
            
            List {
                
                NavigationLink(destination: SecondCustomComposableView(color: colorChoice)) {
                    SimpleListItemView(title: "Progress Loading View",
                                       caption: "The progress bar is \(colorChoice)")
                }
                
            }
            
        }
        .padding()
        .navigationTitle("Another Composable View")
        
    }
}

struct SecondCustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SecondCustomComposableDescriptionView()
        }
    }
}

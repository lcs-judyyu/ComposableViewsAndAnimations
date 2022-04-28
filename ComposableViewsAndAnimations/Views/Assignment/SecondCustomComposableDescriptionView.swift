//
//  SecondCustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Judy Yu on 2022-04-28.
//

import SwiftUI

struct SecondCustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    @State private var phrase: String = ""
    
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
                Picker(selection: .constant(""),
                       label: Text("Color Picker"),
                       content: {
                    
                    Text("Value 1").tag(0)
                    Text("Value 2").tag(1)
                    Text("Value 3").tag(2)
                    Text("Value 4").tag(3)
                    
                })
                .pickerStyle(MenuPickerStyle())
                
            }
            .padding(.bottom)
            
            List {
                
                NavigationLink(destination: SecondCustomComposableView()) {
                    SimpleListItemView(title: "My Composable View",
                                       caption: "A brief description of my view")
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

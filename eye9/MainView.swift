//
//  MainView.swift
//  eye9
//
//  Created by Olga on 2/2/24.
//

import SwiftUI

struct MainView: View {

    var body: some View {
        NavigationView {
            VStack {
                
                Text("Navigate the world like never before.")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 100)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                //            Spacer()
                
                VStack {
                    //                Spacer()
                    Image("eye")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .padding(.bottom, 100)
                    /*   Spacer()*/ // This pushes the image to the top
                }
                
                //            Button(action: {
                //                // Action for visually impaired assistance
                //            }) {
                NavigationLink {
                    FirstView()
                } label: {
                    Text("I can not see")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(Color(red: 61/255, green: 108/255, blue: 179/255))
                        .cornerRadius(10)
                        .padding()
                }
                .padding(.horizontal)
                
                
                
                Button(action: {
                    // Action for connecting to a visually impaired account
                }) {
                    Text("I can see")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(Color(red: 179/255, green: 144/255, blue: 42/255))
                        .cornerRadius(10)
                        .padding()
                }
                .padding(.horizontal)
                Spacer()
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all) // Ignore safe area to extend the background color
        }
        
    }

}

    struct NavigationAssistantView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
    


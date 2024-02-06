//
//  FirstView.swift
//  eye9
//
//  Created by Olga on 2/2/24.
//
import SwiftUI

struct FirstView: View {
    let spaces: [String] = ["Mike's house", "Work", "Home", "McDonald's"]
    var body: some View {
        NavigationView {
            ZStack { // Use ZStack to allow background to be under the text
                Color.black.edgesIgnoringSafeArea(.all) // Set background color to black and ignore safe area
                VStack {
                    HStack {
                        Image(systemName: "list.bullet")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.white)
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 100, height: 40)
                                .foregroundStyle(.white)
                            HStack {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                            .foregroundStyle(.black)
                        }
                    }
                    Text("Let us navigate the world with you.")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                
                let columns = [GridItem(.flexible()), GridItem(.flexible())]
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(spaces, id: \.self) { space in
                                            Button(action: {
                                                // Define the button's action here
                                                print("\(space) button was tapped")
                                            }) {
                                                Text(space)
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(.white)
                                                    .frame(minWidth: 0
                                                           , maxWidth: .infinity, minHeight: 80)
                                                     .padding()
                                                     .background(Color(red: 61/255, green: 108/255, blue: 179/255))
                                                    .cornerRadius(10)
                                                    .frame(height: 100)

                                            }
                                        }
                                    }
                                    .padding()

                                    Spacer() // This will push all content to the top

                
                
                
                VStack {
                    Image("eye")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .padding(.bottom, 400)
                    
                }
                NavigationLink {
                    SecondView()
                } label: {
//                Button(action: {
//                }) {
                    Text("Add a new place")
//                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(Color(red: 179/255, green: 144/255, blue: 42/255))
                        .cornerRadius(10)
                        .padding(.top, 600)
                }
               .padding(.horizontal)
           
            }
//            .padding(.bottom, 20)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}

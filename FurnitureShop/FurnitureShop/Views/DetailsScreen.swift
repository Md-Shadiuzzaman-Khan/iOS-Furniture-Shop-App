//
//  DetailsScreen.swift
//  FurnitureShop
//
//  Created by MacBOOK Pro on 1/1/23.
//

import SwiftUI

struct DetailsScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Image("chair_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    DescriptionView()
                        .offset(y: -40)
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack {
                Text("$120")
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("Add to Cart")
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(Color("Primary"))
                })
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(50, corners: [.topLeft, .topRight])
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: customBackButtonView(action: {
            presentationMode.wrappedValue.dismiss()
        }), trailing: customTrailingButtonView())
    }
}

struct customBackButtonView: View {
    let action: ()-> Void
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "chevron.backward")
            .padding(.all, 12)
            .background(Color.white)
            .cornerRadius(8)
            .foregroundColor(.black)
        })
    }
}

struct customTrailingButtonView: View {
    var body: some View {
        Image("threeDot")
            .resizable()
            .frame(width: 20, height: 20)
            .padding(.all, 12)
            .background(Color.white)
            .cornerRadius(8)
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Luxury \nChair")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("Primary"))
                .padding(.leading)
            
            HStack {
                ForEach(0 ..< 5) {item in
                    Image("star")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            .padding(.leading)
            
            Text("Description")
                .font(.system(size: 22))
                .foregroundColor(Color("Primary"))
                .fontWeight(.medium)
                .padding(.all)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
                .padding(.leading)
                .lineSpacing(6)
                .opacity(0.6)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Size")
                        .foregroundColor(Color("Primary"))
                        .fontWeight(.semibold)
                        .padding(.bottom, 3)
                    Text("Height: 120cm")
                        .opacity(0.6)
                    Text("Width: 80cm")
                        .opacity(0.6)
                    Text("Diameter: 72cm")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Treatment")
                        .foregroundColor(Color("Primary"))
                        .fontWeight(.semibold)
                        .padding(.bottom, 3)
                    Text("Wood, Canvas & \nothers material")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("Colors")
                        .foregroundColor(Color("Primary"))
                        .fontWeight(.semibold)
                    
                    HStack {
                        ColorDotView(color: .white)
                        ColorDotView(color: .black)
                        ColorDotView(color: .red)
                        ColorDotView(color: .teal)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Quentity")
                        .foregroundColor(Color("Primary"))
                        .fontWeight(.semibold)
                    
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(Color("Primary"))
                        
                        Text("1")
                            .foregroundColor(Color("Primary"))
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        Button(action: {}) {
                            Image(systemName: "plus")
                                .padding(.all, 8)
                        }
                        .background(Color("Primary"))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                }
            }
            .padding()
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40)
    }
}

struct ColorDotView: View {
    
    let color: Color
    
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

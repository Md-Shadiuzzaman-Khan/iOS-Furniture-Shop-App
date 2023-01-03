//
//  HomeScreen.swift
//  FurnitureShop
//
//  Created by MacBOOK Pro on 1/1/23.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Chair", "Table", "Sofa", "Lamp", "Kitchen", "Others"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        AppBarView()
                        
                        TagLineView()
                            .padding(.horizontal)
                        
                        searchAndScan()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { i in
                                    CategoryView(isActive: i == selectedIndex, text: categories[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .foregroundColor(Color("Primary"))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 5) { index in
                                    NavigationLink(destination: DetailsScreen(), label: {
                                        ProductCartView(image: Image("chair_\(index + 1)"), size: 210)
                                    })
                                    .navigationBarHidden(true)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        Text("Chair")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .padding(.all)
                            .foregroundColor(Color("Primary"))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 5) { index in
                                    ProductCartView(image: Image("chair_\(index + 1)"), size: 180)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                    }
                }
                
                HStack {
                    BottomNavBarItem(image: Image("Home")) {}
                    BottomNavBarItem(image: Image("heart")) {}
                    BottomNavBarItem(image: Image("shop")) {}
                    BottomNavBarItem(image: Image("user")) {}
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("menu")
                    .resizable()
                    .frame(width: 48, height: 49)
                    .background(Color.white)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image("Profile")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest")
            .font(.system(size: 25))
            .foregroundColor(Color("Primary"))
        
        + Text(" Furniture!")
            .font(.system(size: 35))
            .fontWeight(.bold)
            .foregroundColor(Color("Primary"))
    }
}

struct searchAndScan: View {
    
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.trailing)
            
            Button(action: {}) {
                Image("Scan")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct CategoryView: View {
    
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 22))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary"): Color.black.opacity(0.4))
            
            if(isActive) {
                Color("Primary")
                    .frame(width: 15, height: 4)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCartView: View {
    
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20)
            
            Text("Luxury Chair")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color("Primary"))
            
            HStack(spacing: 2) {
                ForEach(0 ..< 5) {item in
                    Image("star")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                
                Spacer()
                
                Text("$120")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Primary"))
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct BottomNavBarItem: View {
    
    let image: Image
    let action: ()-> Void
    
    var body: some View {
        Button(action: action, label: {
            image
                .resizable()
                .frame(width: 25, height: 25)
                .frame(maxWidth: .infinity)
        })
    }
}

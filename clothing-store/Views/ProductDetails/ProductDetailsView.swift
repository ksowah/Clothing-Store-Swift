//
//  ProductDetailsView.swift
//  clothing
//
//  Created by macbook on 27/03/2025.
//

import SwiftUI

struct ProductDetailsView: View {
    @State private var currentProduct: Int = 0
    @State private var selectedSize: Size = .L
    @EnvironmentObject var router: NavigationCoordinator
    var product: Product
    
    var body: some View {
        VStack {
            ZStack {
                    TabView(selection: $currentProduct) {
                        ForEach(0..<3, id: \.self) { index in
                            Image(product.image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 500)
                                .clipped()
                                .edgesIgnoringSafeArea(.all)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(height: 500)
                    
                    HStack(spacing: 10) {
                        ForEach(0..<3, id: \.self) { index in
                            Capsule()
                                .frame(width: currentProduct == index ? 20 : 7, height: 7)
                                .foregroundColor(currentProduct == index ? .black : .gray)
                                .animation(.easeInOut, value: currentProduct)
                        }
                    }
                    .offset(y:200)
                
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(.white)
                    .blur(radius: 60)
                    .offset(y: -200)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Spacer()
                HStack {
                    VStack(alignment: .leading,spacing: 4) {
                        Text(product.name)
                            .font(.title2)
                            .fontWeight(.medium)
                        Text(product.subtitle)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        CounterView()
                        
                        Text("Available in stock")
                            .font(.caption)
                    }
                }
                
                
                Text("Size")
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.top)
                
                HStack {
                    ForEach(Size.allCases, id: \.self) { size in
                        Button {
                            selectedSize = size
                        } label: {
                            SizeLabel(selected: selectedSize == size, size: size)
                        }                    }
                    }
                
                Text("Description")
                    .font(.headline)
                Text(product.description)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .fixedSize(horizontal: false, vertical: true)
                
                HStack {
                    VStack {
                        Text("Total Price")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("$\(product.price, format: .currency(code: "US"))")
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                    
                    Button {
                        print("")
                    } label: {
                        HStack {
                            Image(systemName: "basket")
                            Text("Add to cart")
                                .font(.subheadline)
                                .fontWeight(.medium)
                        }
                        .frame(width: 160, height: 40)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(20)
                    }

                }
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(.white)
            .cornerRadius(30)
            .offset(y: -30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle(product.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    router.pop()
                } label: {
                    AppToolbarItem(icon: "arrow.backward")
                }
                .foregroundColor(.white)

            }
            ToolbarItem(placement: .navigationBarTrailing) {
                AppToolbarItem(icon: "basket", count: 2)
                    .foregroundColor(.white)
            }
        }

    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: Product.MOCK_PRODUCTS[0])
    }
}

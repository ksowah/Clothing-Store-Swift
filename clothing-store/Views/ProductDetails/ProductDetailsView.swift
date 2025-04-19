//
//  ProductDetailsView.swift
//  clothing
//
//  Created by macbook on 27/03/2025.
//

import SwiftUI
import ClothingStoreAPI
import SDWebImageSwiftUI

struct ProductDetailsView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @EnvironmentObject var router: NavigationCoordinator
    
    @StateObject var productsViewModel = ProductsViewModel()
    
    @State private var currentProduct: Int = 0
    @State private var selectedSize: Size = .L
    
    var productId: String
    
    
    var body: some View {
        VStack {
            if productsViewModel.activeProductRequest != nil {
                ScreenLoader()
            } else {
                if let product = productsViewModel.product {
                    ZStack {
                        TabView(selection: $currentProduct) {
                            ForEach(0..<(product.images?.count ?? 1), id: \.self) { idx in
                                WebImage(url: URL(string: product.images?[idx] ?? "")) { img in
                                    img.resizable()
                                } placeholder: {
                                    Image("")
                                }
                                .indicator(.activity)
                                .scaledToFill()
                                .frame(height: 500)
                                .clipped()
                                .edgesIgnoringSafeArea(.all)
                                .tag(idx)
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .frame(height: 500)
                        
                        HStack(spacing: 10) {
                            ForEach(0..<(product.images?.count ?? 1), id: \.self) { index in
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
                        HStack {
                            VStack(alignment: .leading,spacing: 4) {
                                Text(product.name ?? "")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                Text(product.brand ?? "")
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

                            
                        }
                        .padding(.top)
                        
                        
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
                        Text(product.description ?? "")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        HStack {
                            VStack {
                                Text("Total Price")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                Text("$\(product.price ?? 0.00, format: .currency(code: "US"))")
                                    .fontWeight(.bold)
                            }
                            
                            Spacer()
                            
                            if let cartItem = cartViewModel.getCartItem(id: product._id) {
                                CounterView(item: cartItem)
                            } else {
                                Button {
                                    cartViewModel.addToCart(product: product)
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
                            
                        }
                        
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(.white)
                    .cornerRadius(30)
                    .offset(y: -30)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle(productsViewModel.product?.name ?? "Product Details")
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
                
                Button {
                    router.push(.cartScreen)
                } label: {
                    AppToolbarItem(icon: "basket", showCount: true)
                        .foregroundColor(.white)
                }

            }
        }
        .task({
            productsViewModel.getProduct(for: productId)
        })

    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(productId: "67f7ef16df8ae6feee7d1506")
    }
}

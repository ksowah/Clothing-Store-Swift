//
//  OrderDetailsView.swift
//  clothing
//
//  Created by macbook on 06/04/2025.
//

import SwiftUI

struct OrderTrackingView: View {
    @State var searchTerm = ""
    @EnvironmentObject var router: NavigationCoordinator
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchTextField(searchText: $searchTerm, submitBtnIcon: "barcode.viewfinder")
            
            VStack {
                HStack(alignment: .top, spacing: 14) {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    
                    VStack(alignment: .leading) {
                        Text("6557 3445 855")
                            .fontWeight(.bold)
                        Text("Ena Express")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    Text("Trasit")
                        .font(.caption)
                        .fontWeight(.bold)
                }
                .padding(.bottom)
                
                OrderStage(currentStep: 1)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("25 June, 2021")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("Sacramato")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("25 June, 2021")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("Sacramato")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding(.top)
            }
            .frame(maxWidth: .infinity, maxHeight: 150)
            .padding()
            .background(.white)
            .cornerRadius(20)
            .shadow(color: Color(.systemGray5),radius: 10)
            .padding(.vertical, 30)
            
            Text("Tracking")
                .font(.headline)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 10) {
                StageCard()
                StageCard()
                StageCard()
                StageCard()
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle("Order")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    router.pop()
                } label: {
                    AppToolbarItem(icon: "arrow.backward")
                }

            }
        }
    }
}

struct OrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTrackingView()
    }
}

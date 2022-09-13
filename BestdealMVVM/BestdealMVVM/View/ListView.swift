//
//  ListView.swift
//  BestdealMVVM
//
//  Created by Mathis Higuinen on 18/08/2022.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var priceviewModel:ProductViewModel
    var body: some View {
        List{
            
            ForEach(Categorie.allCases,id:\.self){ cat in
                
                Section {
                 
                    ForEach(priceviewModel.products.filter{$0.categorie == cat},id:\.self){ product in
                        
                        Text("\(product.finalPrice, specifier: "%.2f")€")

                    }
                    HStack{
                        Spacer()
                    Text("\(priceviewModel.products.filter{$0.categorie == cat}.map{$0.finalPrice}.reduce(0,+), specifier: "%.2f")€")
                    }
                    
                } header: {
                  
                        Text("\(cat.description)")
                    
                }

            }
          
        }
    }
}

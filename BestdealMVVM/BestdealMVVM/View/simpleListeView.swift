//
//  simpleListeView.swift
//  BestdealMVVM
//
//  Created by Mathis Higuinen on 18/08/2022.
//

import SwiftUI

struct simpleListeView: View {
    @ObservedObject var priceviewModel:ProductViewModel
    var body: some View {
       
        List{
            
            ForEach(priceviewModel.products,id:\.self){ product in
         
                HStack{
                    
                    Text("\(Double(product.initialPrice)!, specifier: "%.2f")€ - \(product.discount, specifier: "%.2f")%")
                    Spacer()
                    Text("\(product.finalPrice, specifier: "%.2f")€")
                    
                    Menu {
                        
                        ForEach(Categorie.allCases,id:\.self){ cat in
                            
                            Button {
                             
                                priceviewModel.modifCategorie(producid: product.hashValue, categorie: cat)
                    
                            } label: {
                                Text("\(cat.description)")
                            }
                           
                        }
                        
                    } label: {
                        Image(systemName: "tag.fill")
                    }
                
                }
                Text("\(product.categorie.description)")
               
                              
            }.onDelete { (IndexSet) in
                priceviewModel.products.remove(atOffsets: IndexSet)
 
            }
                
        }
    }
}


//
//  ContentView.swift
//  BestdealMVVM
//
//  Created by Mathis Higuinen on 17/08/2022.
//

import SwiftUI

struct ContentView: View {
  
    @StateObject var priceviewModel = ProductViewModel()
    @State var showDetail = false

    func talatalCart()->Double{
        

        var somme = Double(0)
        
        for product in priceviewModel.products{
            somme = somme + product.finalPrice
        }
        
        
    return somme
        
    }
    
    
        var totalEconomie:some View{
            Text("\(priceviewModel.products.map{  Double($0.initialPrice)!-$0.finalPrice }.reduce(0,+),specifier: "%.2f")")
        }
     
        var totalCart:some View{
            Text("\(priceviewModel.products.map{ $0.finalPrice }.reduce(0,+),specifier: "%.2f")")
        }
        
    var body: some View {
        NavigationView{
                VStack{
                    
                    VStack{
                        TextField("Entrez un prix", text:$priceviewModel.product.initialPrice)
                            .keyboardType(.numberPad)
                        Divider()
                    }.padding()
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        
                        HStack{
                
                        ForEach(1..<20,id:\.self){ porcentage in
                            
                            Button {
                                
                                priceviewModel.addDiscount(discount: String(porcentage*5))
                                
                            } label: {
                                Text("\(porcentage*5) %")
                                    .padding()
                                    .overlay(Circle().stroke())
                            }

                        }
          
                        }.padding()
                        
                    }
                    
                    if priceviewModel.product.initialPrice != "0.0"{
                        
                        if priceviewModel.product.discount != 0{
                            
                            Text("\(priceviewModel.product.finalPrice, specifier: "%.2f")€")
                        
                        }else{
                            Text("\(Double(priceviewModel.product.initialPrice) ?? 0.0, specifier: "%.2f")€")
                        }

                    }else{
                        Text("Nouveau prix")
                        
                    }
                    
                    HStack{
                        Image(systemName: "cart")
                        Button {
                    
                            if priceviewModel.product.initialPrice != ""{
                                priceviewModel.addProduct()
                            }
                        
                        } label: {
                            Text("J' ACHETE")
                        }

                    }.padding()
                    
                    totalCart
                    
                    simpleListeView(priceviewModel: priceviewModel)
                    
                    Spacer()
                    
                    HStack{
                        
                        totalEconomie
                        
                        NavigationLink {
                            
                        ListView(priceviewModel: priceviewModel)
                            
                        } label: {

                                Image(systemName: "cart.fill")
                            
                        }
                }
                    .navigationTitle("Reduc' Facile")
                    
                    }
            }
      
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

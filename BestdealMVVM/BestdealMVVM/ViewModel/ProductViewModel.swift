//
//  ProductViewModel.swift
//  BestdealMVVM
//
//  Created by Mathis Higuinen on 18/08/2022.
//

import Foundation

class ProductViewModel:ObservableObject{
    
    @Published var products:[Product] = []
    @Published var product:Product = Product(initialPrice: "")
    
    
    func addDiscount(discount:String){
        
        guard let discount = Double(discount) else {return}
        self.product.discount = discount
        self.product.finalPrice = Double(discount * (Double(product.initialPrice)!/100))
        
    }
    
    func modifCategorie(producid:Int,categorie:Categorie){
        
        for i in 0..<self.products.count{
        
           
            if self.products[i].hashValue == producid {
              
                self.products[i].categorie = categorie
             
            }
         
        }
    }
    
    func addProduct(){
        
        if self.product.discount == Double(0){
            self.product.finalPrice = Double(self.product.initialPrice)!
            self.products.append(self.product)
            self.product.initialPrice = ""
            self.product.discount = 0.0
        }else{
            self.products.append(self.product)
            self.product.initialPrice = ""
            self.product.discount = 0.0
        }
       
    }
    
    func removeCart(){
        self.products.removeAll()
    }
    
    
}


//
//  Product.swift
//  BestdealMVVM
//
//  Created by Mathis Higuinen on 18/08/2022.
//

import Foundation




struct Product:Identifiable,Hashable{
    
    var id = UUID().uuidString
    var description: String? = ""
    var initialPrice: String 
    var finalPrice:
   Double = 0.0
    var discount: Double = 0.0
    var categorie: Categorie = .Divers
    
}


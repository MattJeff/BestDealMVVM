//
//  Categorie.swift
//  BestdealMVVM
//
//  Created by Mathis Higuinen on 18/08/2022.
//

import Foundation

enum Categorie:CaseIterable{
    
    
    case Divers
    case Mode
    case Nourriture
    case Electromenager
    case Bricolage
    case Multimédia
    case Meuble_et_deco
    case Jardin_et_maison
    case Informatique
    case Telephonie
    case Jeux_vidéo
    case Sport
    
   
    var description: String {
        
        switch self {
            case .Divers: return "Divers"
            case .Mode: return "Mode"
            case .Nourriture: return "Nourriture"
            case .Electromenager: return "Electoménager"
            case .Bricolage: return "Bricolage"
            case .Multimédia: return "Multimédia"
            case .Meuble_et_deco: return "Meuble et déco."
            case .Jardin_et_maison: return"Jardin et maison"
            case .Informatique: return "Informatique"
            case .Telephonie: return "Téléphonie"
            case .Jeux_vidéo: return  "Jeux video"
            case .Sport: return "Sport"
        }
        
    }
}

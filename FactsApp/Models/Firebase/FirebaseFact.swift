//
//  FirebaseFact.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 27.04.2025.
//

import Foundation
import FirebaseFirestore

struct FirebaseFact: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    var categoryId: String
    var text: String
    var sourceUrl: String
    
    var id: String {
        uid ?? NSUUID().uuidString
    }
    
}

extension FirebaseFact {
    static let sampleList: [FirebaseFact] = [
        FirebaseFact(categoryId: FactCategory.sampleList[0].id, text: "Brno bylo centrem německé kolonizace ve 13. století, což přispělo k jeho růstu.", sourceUrl: "https://www.britannica.com/place/Brno"),
        FirebaseFact(categoryId: FactCategory.sampleList[1].id, text: "Měnínská brána je jedinou dochovanou městskou branou v Brně.", sourceUrl: "https://www.pamatkybrno.cz/meninska-brana/"),
        FirebaseFact(categoryId: FactCategory.sampleList[1].id, text: "Brněnské hlavní nádraží je významným železničním uzlem v České republice.", sourceUrl: "https://cs.wikipedia.org/wiki/Brno_hlavní_nádraží"),
        FirebaseFact(categoryId: FactCategory.sampleList[2].id, text: "Brněnské podzemí pod Zelným trhem tvoří labyrint středověkých chodeb a sklepů.", sourceUrl: "https://en.wikipedia.org/wiki/Zeln%C3%BD_trh"),
        FirebaseFact(categoryId: FactCategory.sampleList[3].id, text: "V Brně působil Gregor Johann Mendel, zakladatel genetiky, který zde prováděl své experimenty s hrachem.", sourceUrl: "https://www.mendelmuseum.muni.cz/"),
        FirebaseFact(categoryId: FactCategory.sampleList[3].id, text: "Masarykova univerzita v Brně byla založena v roce 1919 a je druhou největší univerzitou v České republice.", sourceUrl: "https://www.muni.cz/"),
        FirebaseFact(categoryId: FactCategory.sampleList[4].id, text: "Brněnské podnebí je mírně kontinentální s teplými léty a chladnými zimami.", sourceUrl: "https://www.brno.cz/"),
        FirebaseFact(categoryId: FactCategory.sampleList[4].id, text: "Brněnský Wilsonův les je největší městský lesopark ve městě.", sourceUrl: "https://www.pruvodcebrnem.cz/park/wilsonuv-les/")
    ]
}



//
//  Fact.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 27.04.2025.
//

import Foundation

struct Fact: Codable, Identifiable, Hashable {
    var id: String = UUID().uuidString
    var category: FactCategory
    var text: String
    var sourceUrl: String
    
}

struct FactList {
    static let sampleList: [Fact] = [
        Fact(category: FactCategoryList.sampleList[4], text: "Brno je druhé největší město České republiky s přibližně 400 000 obyvateli.", sourceUrl: "https://en.wikipedia.org/wiki/Brno"),
        Fact(category: FactCategoryList.sampleList[0], text: "Brno bylo hlavním městem Moravy od roku 1641 do roku 1948.", sourceUrl: "https://www.amazingczechia.com/destinations/brno/"),
        Fact(category: FactCategoryList.sampleList[0], text: "Brno bylo založeno jako město v roce 1243.", sourceUrl: "https://www.britannica.com/place/Brno"),
        Fact(category: FactCategoryList.sampleList[0], text: "Brněnský hrad Špilberk byl postaven ve 13. století jako sídlo moravských markrabat.", sourceUrl: "https://www.britannica.com/place/Brno"),
        Fact(category: FactCategoryList.sampleList[0], text: "V roce 1645 Brno úspěšně odolalo švédskému obléhání během třicetileté války.", sourceUrl: "https://www.britannica.com/place/Brno"),
        Fact(category: FactCategoryList.sampleList[0], text: "Brno bylo dočasným hlavním městem Československa v letech 1948 až 1960.", sourceUrl: "https://alexstaff.agency/designer-cyprus-ls/tpost/tr48zx7sl1-deep-into-the-czech-republic-10-facts-ab"),
        Fact(category: FactCategoryList.sampleList[0], text: "V roce 1805 se poblíž Brna odehrála Bitva u Slavkova, známá také jako Bitva tří císařů.", sourceUrl: "https://en.wikipedia.org/wiki/Battle_of_Austerlitz"),
        Fact(category: FactCategoryList.sampleList[0], text: "V 19. století bylo Brno známé jako \"Moravský Manchester\" díky svému textilnímu průmyslu.", sourceUrl: "https://en.wikipedia.org/wiki/Brno"),
        Fact(category: FactCategoryList.sampleList[0], text: "Brno bylo centrem německé kolonizace ve 13. století, což přispělo k jeho růstu.", sourceUrl: "https://www.britannica.com/place/Brno"),
        Fact(category: FactCategoryList.sampleList[0], text: "V roce 1928 bylo otevřeno brněnské výstaviště, které patří k největším v Evropě.", sourceUrl: "https://www.amazingczechia.com/destinations/brno/"),
        Fact(category: FactCategoryList.sampleList[1], text: "Vila Tugendhat v Brně je památkou UNESCO a příkladem funkcionalistické architektury.", sourceUrl: "https://en.wikipedia.org/wiki/Villa_Tugendhat"),
        Fact(category: FactCategoryList.sampleList[1], text: "Katedrála svatého Petra a Pavla je dominantou Brna a významnou památkou.", sourceUrl: "https://jp.czech-unesco.org/13_3303_st-peter-and-paul-s-cathedral-brno/"),
        Fact(category: FactCategoryList.sampleList[1], text: "Brněnský orloj na náměstí Svobody je známý svým neobvyklým designem a každý den v 11:00 vypouští skleněnou kuličku.", sourceUrl: "https://en.wikipedia.org/wiki/Brno_astronomical_clock"),
        Fact(category: FactCategoryList.sampleList[1], text: "Kapucínská hrobka v Brně obsahuje mumifikovaná těla mnichů díky specifickým podmínkám.", sourceUrl: "https://en.wikipedia.org/wiki/Capuchin_Crypt_in_Brno"),
        Fact(category: FactCategoryList.sampleList[1], text: "Kašna Parnas na Zelném trhu je barokní fontána z konce 17. století.", sourceUrl: "https://en.wikipedia.org/wiki/Zeln%C3%BD_trh"),
        Fact(category: FactCategoryList.sampleList[1], text: "Stará radnice v Brně je nejstarší světskou stavbou ve městě a nabízí vyhlídkovou věž.", sourceUrl: "https://turistickamapa.cz/vyhlidkova-vez-stara-radnice-brno/"),
        Fact(category: FactCategoryList.sampleList[1], text: "Palác šlechtičen je barokní budova v centru Brna, nyní součást Moravského zemského muzea.", sourceUrl: "https://www.pamatkybrno.cz/palac-slechticen/"),
        Fact(category: FactCategoryList.sampleList[1], text: "Brno je považováno za centrum modernistické architektury v České republice.", sourceUrl: "https://modernism-in-architecture.org/facts/brno/"),
        Fact(category: FactCategoryList.sampleList[1], text: "Měnínská brána je jedinou dochovanou městskou branou v Brně.", sourceUrl: "https://www.pamatkybrno.cz/meninska-brana/"),
        Fact(category: FactCategoryList.sampleList[1], text: "Brněnské hlavní nádraží je významným železničním uzlem v České republice.", sourceUrl: "https://cs.wikipedia.org/wiki/Brno_hlavní_nádraží"),
        Fact(category: FactCategoryList.sampleList[2], text: "Brněnské výstaviště pořádá ročně přibližně 50 veletrhů a akcí s více než milionem návštěvníků.", sourceUrl: "https://www.amazingczechia.com/destinations/brno/"),
        Fact(category: FactCategoryList.sampleList[2], text: "Festival Ignis Brunensis je každoroční mezinárodní přehlídka ohňostrojů v Brně.", sourceUrl: "https://www.ignisbrunensis.cz/"),
        Fact(category: FactCategoryList.sampleList[2], text: "Muzeum romské kultury v Brně je jediné svého druhu v Evropě.", sourceUrl: "https://blog.giveback.guide/brno/"),
        Fact(category: FactCategoryList.sampleList[2], text: "Brněnské vánoční trhy byly vyhlášeny Evropským hlavním městem Vánoc.", sourceUrl: "https://www.thesun.ie/travel/14236528/european-capital-christmas-market-czech-prague-brno/"),
        Fact(category: FactCategoryList.sampleList[2], text: "Brněnský orloj připomíná vítězství nad Švédy během třicetileté války.", sourceUrl: "https://en.wikipedia.org/wiki/Brno_astronomical_clock"),
        Fact(category: FactCategoryList.sampleList[2], text: "Brno má bohatou pivní kulturu s mnoha místními pivovary a hospodami.", sourceUrl: "https://www.thesun.ie/travel/12567881/czech-republic-charming-city-brno-travel-europe/"),
        Fact(category: FactCategoryList.sampleList[2], text: "Brněnský drak visící na Staré radnici je ve skutečnosti krokodýl darovaný městu.", sourceUrl: "https://www.thesun.ie/travel/12567881/czech-republic-charming-city-brno-travel-europe/"),
        Fact(category: FactCategoryList.sampleList[2], text: "V Brně se nachází druhá největší kostnice v Evropě pod kostelem sv. Jakuba.", sourceUrl: "https://www.thesun.ie/travel/12567881/czech-republic-charming-city-brno-travel-europe/"),
        Fact(category: FactCategoryList.sampleList[2], text: "Brněnské podzemí pod Zelným trhem tvoří labyrint středověkých chodeb a sklepů.", sourceUrl: "https://en.wikipedia.org/wiki/Zeln%C3%BD_trh")
    ]
}



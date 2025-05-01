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
        FirebaseFact(categoryId: FactCategory.sampleList[0].safeId, text: "Brno je druhé největší město České republiky s přibližně 400 000 obyvateli.", sourceUrl: "https://en.wikipedia.org/wiki/Brno"),
        FirebaseFact(categoryId: FactCategory.sampleList[0].safeId, text: "Brno bylo hlavním městem Moravy od roku 1641 do roku 1948.", sourceUrl: "https://www.amazingczechia.com/destinations/brno/"),
        FirebaseFact(categoryId: FactCategory.sampleList[0].safeId, text: "Brno bylo založeno jako město v roce 1243.", sourceUrl: "https://www.britannica.com/place/Brno"),
        FirebaseFact(categoryId: FactCategory.sampleList[0].safeId, text: "Brněnský hrad Špilberk byl postaven ve 13. století jako sídlo moravských markrabat.", sourceUrl: "https://www.britannica.com/place/Brno"),
        FirebaseFact(categoryId: FactCategory.sampleList[0].safeId, text: "V roce 1645 Brno úspěšně odolalo švédskému obléhání během třicetileté války.", sourceUrl: "https://www.britannica.com/place/Brno"),
        FirebaseFact(categoryId: FactCategory.sampleList[0].safeId, text: "Brno bylo dočasným hlavním městem Československa v letech 1948 až 1960.", sourceUrl: "https://alexstaff.agency/designer-cyprus-ls/tpost/tr48zx7sl1-deep-into-the-czech-republic-10-facts-ab"),
        FirebaseFact(categoryId: FactCategory.sampleList[0].safeId, text: "V roce 1805 se poblíž Brna odehrála Bitva u Slavkova, známá také jako Bitva tří císařů.", sourceUrl: "https://en.wikipedia.org/wiki/Battle_of_Austerlitz"),
        FirebaseFact(categoryId: FactCategory.sampleList[0].safeId, text: "V 19. století bylo Brno známé jako \"Moravský Manchester\" díky svému textilnímu průmyslu.", sourceUrl: "https://en.wikipedia.org/wiki/Brno"),
        FirebaseFact(categoryId: FactCategory.sampleList[0].safeId, text: "Brno bylo centrem německé kolonizace ve 13. století, což přispělo k jeho růstu.", sourceUrl: "https://www.britannica.com/place/Brno"),
        FirebaseFact(categoryId: FactCategory.sampleList[0].safeId, text: "V roce 1928 bylo otevřeno brněnské výstaviště, které patří k největším v Evropě.", sourceUrl: "https://www.amazingczechia.com/destinations/brno/"),
        FirebaseFact(categoryId: FactCategory.sampleList[1].safeId, text: "Vila Tugendhat v Brně je památkou UNESCO a příkladem funkcionalistické architektury.", sourceUrl: "https://en.wikipedia.org/wiki/Villa_Tugendhat"),
        FirebaseFact(categoryId: FactCategory.sampleList[1].safeId, text: "Katedrála svatého Petra a Pavla je dominantou Brna a významnou památkou.", sourceUrl: "https://jp.czech-unesco.org/13_3303_st-peter-and-paul-s-cathedral-brno/"),
        FirebaseFact(categoryId: FactCategory.sampleList[1].safeId, text: "Brněnský orloj na náměstí Svobody je známý svým neobvyklým designem a každý den v 11:00 vypouští skleněnou kuličku.", sourceUrl: "https://en.wikipedia.org/wiki/Brno_astronomical_clock"),
        FirebaseFact(categoryId: FactCategory.sampleList[1].safeId, text: "Kapucínská hrobka v Brně obsahuje mumifikovaná těla mnichů díky specifickým podmínkám.", sourceUrl: "https://en.wikipedia.org/wiki/Capuchin_Crypt_in_Brno"),
        FirebaseFact(categoryId: FactCategory.sampleList[1].safeId, text: "Kašna Parnas na Zelném trhu je barokní fontána z konce 17. století.", sourceUrl: "https://en.wikipedia.org/wiki/Zeln%C3%BD_trh"),
        FirebaseFact(categoryId: FactCategory.sampleList[1].safeId, text: "Stará radnice v Brně je nejstarší světskou stavbou ve městě a nabízí vyhlídkovou věž.", sourceUrl: "https://turistickamapa.cz/vyhlidkova-vez-stara-radnice-brno/"),
        FirebaseFact(categoryId: FactCategory.sampleList[1].safeId, text: "Palác šlechtičen je barokní budova v centru Brna, nyní součást Moravského zemského muzea.", sourceUrl: "https://www.pamatkybrno.cz/palac-slechticen/"),
        FirebaseFact(categoryId: FactCategory.sampleList[1].safeId, text: "Brno je považováno za centrum modernistické architektury v České republice.", sourceUrl: "https://modernism-in-architecture.org/facts/brno/"),
        FirebaseFact(categoryId: FactCategory.sampleList[1].safeId, text: "Měnínská brána je jedinou dochovanou městskou branou v Brně.", sourceUrl: "https://www.pamatkybrno.cz/meninska-brana/"),
        FirebaseFact(categoryId: FactCategory.sampleList[1].safeId, text: "Brněnské hlavní nádraží je významným železničním uzlem v České republice.", sourceUrl: "https://cs.wikipedia.org/wiki/Brno_hlavní_nádraží"),
        FirebaseFact(categoryId: FactCategory.sampleList[2].safeId, text: "Brněnské výstaviště pořádá ročně přibližně 50 veletrhů a akcí s více než milionem návštěvníků.", sourceUrl: "https://www.amazingczechia.com/destinations/brno/"),
        FirebaseFact(categoryId: FactCategory.sampleList[2].safeId, text: "Festival Ignis Brunensis je každoroční mezinárodní přehlídka ohňostrojů v Brně.", sourceUrl: "https://www.ignisbrunensis.cz/"),
        FirebaseFact(categoryId: FactCategory.sampleList[2].safeId, text: "Muzeum romské kultury v Brně je jediné svého druhu v Evropě.", sourceUrl: "https://blog.giveback.guide/brno/"),
        FirebaseFact(categoryId: FactCategory.sampleList[2].safeId, text: "Brněnské vánoční trhy byly vyhlášeny Evropským hlavním městem Vánoc.", sourceUrl: "https://www.thesun.ie/travel/14236528/european-capital-christmas-market-czech-prague-brno/"),
        FirebaseFact(categoryId: FactCategory.sampleList[2].safeId, text: "Brněnský orloj připomíná vítězství nad Švédy během třicetileté války.", sourceUrl: "https://en.wikipedia.org/wiki/Brno_astronomical_clock"),
        FirebaseFact(categoryId: FactCategory.sampleList[2].safeId, text: "Brno má bohatou pivní kulturu s mnoha místními pivovary a hospodami.", sourceUrl: "https://www.thesun.ie/travel/12567881/czech-republic-charming-city-brno-travel-europe/"),
        FirebaseFact(categoryId: FactCategory.sampleList[2].safeId, text: "Brněnský drak visící na Staré radnici je ve skutečnosti krokodýl darovaný městu.", sourceUrl: "https://www.thesun.ie/travel/12567881/czech-republic-charming-city-brno-travel-europe/"),
        FirebaseFact(categoryId: FactCategory.sampleList[2].safeId, text: "V Brně se nachází druhá největší kostnice v Evropě pod kostelem sv. Jakuba.", sourceUrl: "https://www.thesun.ie/travel/12567881/czech-republic-charming-city-brno-travel-europe/"),
        FirebaseFact(categoryId: FactCategory.sampleList[2].safeId, text: "Brněnské podzemí pod Zelným trhem tvoří labyrint středověkých chodeb a sklepů.", sourceUrl: "https://en.wikipedia.org/wiki/Zeln%C3%BD_trh"),
        FirebaseFact(categoryId: FactCategory.sampleList[3].safeId, text: "V Brně působil Gregor Johann Mendel, zakladatel genetiky, který zde prováděl své experimenty s hrachem.", sourceUrl: "https://www.mendelmuseum.muni.cz/"),
        FirebaseFact(categoryId: FactCategory.sampleList[3].safeId, text: "Masarykova univerzita v Brně byla založena v roce 1919 a je druhou největší univerzitou v České republice.", sourceUrl: "https://www.muni.cz/"),
        FirebaseFact(categoryId: FactCategory.sampleList[3].safeId, text: "Vědecké centrum CEITEC v Brně se specializuje na výzkum v oblasti živých a materiálových věd.", sourceUrl: "https://www.ceitec.eu/"),
        FirebaseFact(categoryId: FactCategory.sampleList[3].safeId, text: "Brněnské VIDA! science centrum nabízí interaktivní expozice zaměřené na přírodní a technické vědy.", sourceUrl: "https://vida.cz/"),
        FirebaseFact(categoryId: FactCategory.sampleList[3].safeId, text: "Veterinární univerzita v Brně byla založena již v roce 1918 a je nejstarší veterinární školou v Československu.",sourceUrl: "https://www.vfu.cz/"),
        FirebaseFact(categoryId: FactCategory.sampleList[3].safeId, text: "Brno je sídlem Vysokého učení technického (VUT), které je největší technickou univerzitou na Moravě.", sourceUrl: "https://www.vut.cz/"),
        FirebaseFact(categoryId: FactCategory.sampleList[3].safeId, text: "Středoevropský technologický institut (CEITEC) v Brně je společný projekt šesti výzkumných institucí.", sourceUrl: "https://www.ceitec.eu/"),
        FirebaseFact(categoryId: FactCategory.sampleList[3].safeId, text: "Brno je centrem výzkumu v oblasti elektronové mikroskopie a sídlem několika světových výrobců.", sourceUrl: "https://www.thermofisher.com/cz/en/home/electron-microscopy.html"),
        FirebaseFact(categoryId: FactCategory.sampleList[3].safeId, text: "Centrum RECETOX v Brně se zaměřuje na výzkum toxických látek a jejich dopadu na životní prostředí a zdraví.", sourceUrl: "https://www.recetox.muni.cz/"),
        FirebaseFact(categoryId: FactCategory.sampleList[3].safeId, text: "Brno hostí mezinárodní veletrh AMPER, zaměřený na elektrotechniku, energetiku a automatizaci.", sourceUrl: "https://www.amper.cz/"),
        FirebaseFact(categoryId: FactCategory.sampleList[4].safeId, text: "Brno leží na soutoku řek Svratky a Svitavy.", sourceUrl: "https://cs.wikipedia.org/wiki/Brno"),
        FirebaseFact(categoryId: FactCategory.sampleList[4].safeId, text: "Brněnská přehrada slouží jako rekreační oblast i vodní rezervoár.", sourceUrl: "https://www.prvni-brnenska.cz/brnenska-prehrada/"),
        FirebaseFact(categoryId: FactCategory.sampleList[4].safeId, text: "Brno má rozlohu přibližně 230 km².", sourceUrl: "https://cs.wikipedia.org/wiki/Brno"),
        FirebaseFact(categoryId: FactCategory.sampleList[4].safeId, text: "Brno se nachází v nadmořské výšce 190 až 479 m n. m.", sourceUrl: "https://cs.wikipedia.org/wiki/Brno"),
        FirebaseFact(categoryId: FactCategory.sampleList[4].safeId, text: "Brno je obklopeno kopci Drahanské vrchoviny a Bobravské vrchoviny.", sourceUrl: "https://cs.wikipedia.org/wiki/Brno"),
        FirebaseFact(categoryId: FactCategory.sampleList[4].safeId, text: "Brno má 48 městských částí a 29 katastrálních území.", sourceUrl: "https://www.brno.cz/"),
        FirebaseFact(categoryId: FactCategory.sampleList[4].safeId, text: "Letiště Brno-Tuřany se nachází 7,5 km od centra města.", sourceUrl: "https://www.brno-airport.cz/"),
        FirebaseFact(categoryId: FactCategory.sampleList[4].safeId, text: "Brno leží asi 200 km jihovýchodně od Prahy a 130 km severně od Vídně.", sourceUrl: "https://cs.wikipedia.org/wiki/Brno"),
        FirebaseFact(categoryId: FactCategory.sampleList[4].safeId, text: "Brněnské podnebí je mírně kontinentální s teplými léty a chladnými zimami.", sourceUrl: "https://www.brno.cz/"),
        FirebaseFact(categoryId: FactCategory.sampleList[4].safeId, text: "Brněnský Wilsonův les je největší městský lesopark ve městě.", sourceUrl: "https://www.pruvodcebrnem.cz/park/wilsonuv-les/")
    ]
}



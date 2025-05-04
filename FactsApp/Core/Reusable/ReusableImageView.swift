//
//  ReusableImageView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 03.05.2025.
//

import SwiftUI

enum Sizing {
    case xxsmall
    case xsmall
    case small
    case medium
    
    var dimension: CGFloat {
        switch self {
        case .xxsmall:
            return 10
        case .xsmall:
            return 15
        case .small:
            return 20
        case .medium:
            return 25
        }
        
    }
}

struct ReusableImageView: View {
    
    var systemName: String
    var size: Sizing
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .frame(width: size.dimension)
            .padding()
    }
}

#Preview {
    ReusableImageView(systemName: "heart", size: .small)
}

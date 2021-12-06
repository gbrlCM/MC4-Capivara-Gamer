//
//  Share.swift
//  Capivara
//
//  Created by Vitor Cheung on 06/12/21.
//

import SwiftUI

struct Share: View {
    let TextoCompartido = "Hola 😀 "
    
    var body: some View {
        
        Button(action: actionSheet) {
                       Image(systemName: "square.and.arrow.up")
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 36, height: 36)
                   }
            
    }
    
    func actionSheet() {
           guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
           let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
           UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
       }
}

struct Share_Previews: PreviewProvider {
    static var previews: some View {
        Share()
    }
}

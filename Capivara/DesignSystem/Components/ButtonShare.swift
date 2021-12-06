//
//  ButtonShare.swift
//  Capivara
//
//  Created by Vitor Cheung on 06/12/21.
//

import SwiftUI

struct ButtonShare: View {
    
    var urlLink: String
    
    var body: some View {
        
        Button(action: actionSheet) {
                       Image(systemName: "square.and.arrow.up")
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 36, height: 36)
                   }
            
    }
    
    func actionSheet() {
           guard let urlShare = URL(string: urlLink) else { return }
           let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
           UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
       }
}

struct ButtonShare_Previews: PreviewProvider {
    static var previews: some View {
        ButtonShare(urlLink: "https://developer.apple.com/xcode/swiftui/")
    }
}

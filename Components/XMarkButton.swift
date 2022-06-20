//
//  XMarkButton.swift
//  Cheetah
//
//  Created by Mustafa Pekdemir on 20.06.2022.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}
struct Button_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}

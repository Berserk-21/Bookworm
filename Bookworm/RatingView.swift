//
//  RatingView.swift
//  Bookworm
//
//  Created by Berserk on 04/06/2024.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    var label = ""
    
    var maximumRating: Int = 5
    
    var starImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    starImage
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        // Deactivate tapping row and all of the buttons in order.
        .buttonStyle(.plain)
    }
    
}

#Preview {
    RatingView(rating: .constant(4))
}

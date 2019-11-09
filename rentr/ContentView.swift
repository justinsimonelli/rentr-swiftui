//
//  ContentView.swift
//  rentr
//
//  Created by Justin Simonelli on 11/9/19.
//  Copyright © 2019 Justin Simonelli. All rights reserved.
//

import SwiftUI

let now = Date()

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Howdy Sims!")
                .font(.title)
                .padding(.bottom, 25.0)
            Text("\(now.month) \(now.year) Rent")
                .font(.title)
            Text("$1000")
                .font(.title)
            HStack {
                Spacer()
                Button(action: {
                    let url: NSURL = URL(string: "venmo://")! as NSURL
                    UIApplication.shared.open(url as URL)
                }) {
                    Text("Pay Now!")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.green, lineWidth: 5)
                        )
                }
                Spacer()
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: self)
    }
}

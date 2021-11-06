//
//  ContentView.swift
//  CardWar
//
//  Created by Kovalyov Dmitry on 04.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card2"
    @State private var cpuCard = "card2"
    
    @State private var playerScore = 0
    @State  private var cpuScore = 0

    var body: some View {
        
        ZStack {
            Image("background")
                .ignoresSafeArea()
                .scaledToFill()
            
            VStack {
                Spacer()
                
                Image("logo")
                    .padding(.top, 40 )
                Spacer()
// cards
                HStack {
                    Spacer()
                    Image(playerCard)
                        .padding()
                    Spacer()
                    Image(cpuCard)
                        .padding()
                    Spacer()
                }
                
                Spacer()
// button
                Button(action: {
                    
                    let randomPlayerCard = Int.random(in: 2...14)
                    let randomCpuCard = Int.random(in: 2...14)
                    
                    playerCard = "card" + String(randomPlayerCard)
                    cpuCard = "card" + String(randomCpuCard)
                    
                    if randomPlayerCard > randomCpuCard {
                        playerScore += 1
                    } else if randomCpuCard > randomPlayerCard {
                        cpuScore += 1
                    }
                },
                       label: {
                    Image("dealbutton")
                })
                Spacer()
                
                HStack {
                    VStack {
                        Text("Player")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                        Text("\(playerScore)")
                            .font(.title)
                            .padding(.bottom, 45)
                            .foregroundColor(.white)
                    }
                    VStack {
                        Text("CPU")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                        Text("\(cpuScore)")
                            .font(.title)
                            .padding(.bottom, 45)
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                }
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}

//
//  ContentView.swift
//  WarCardGame
//
//  Created by Lim Si Eian on 16/10/21.
//

import SwiftUI

struct ContentView: View
{
    @State private var strPlayerCard = ""
    @State private var strCPUCard = ""
    @State private var nPlayerScore = 0
    @State private var nCPUScore = 0
    
    var body: some View
    {
        
        ZStack
        {
            Image("background").ignoresSafeArea()
            
            VStack
            {
                Spacer()
                Image("logo")
                    .aspectRatio(contentMode: .fit)
                Spacer()
                HStack
                {
                    Image(strPlayerCard)
                        .aspectRatio(contentMode: .fit)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Image(strCPUCard)
                        .aspectRatio(contentMode: .fit)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                
                Button
                {
                    //Random Gen between 2 and 14
                    let nPlayerRand = Int.random(in: 2...14)
                    let nCPURand = Int.random(in: 2...14)

                    //update player card
                    strPlayerCard = "card" + String(nPlayerRand)
                    strCPUCard = "card" + String(nCPURand)
                    
                    //update score
                    if(nPlayerRand > nCPURand)
                    {
                        nPlayerScore+=1
                    }
                    else if(nCPURand > nPlayerRand)
                    {
                        nCPUScore+=1
                    }
                
                }
                label:
                {
                    Image("dealbutton")
                }
                
                Spacer()
                
                VStack
                {
                    HStack
                    {
                        VStack
                        {
                            Text("Player").font(.headline).padding(.bottom, 10.0)
                            Text(String(nPlayerScore)).font(.largeTitle)
                        }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        VStack
                        {
                            Text("CPU").font(.headline).padding(.bottom, 10.0)
                            Text(String(nCPUScore))
                        }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).font(.largeTitle)
                    }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }.foregroundColor(Color.white)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

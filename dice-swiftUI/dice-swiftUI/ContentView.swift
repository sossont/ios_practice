//
//  ContentView.swift
//  dice-swiftUI
//
//  Created by 정환우 on 2021/08/19.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = Int.random(in: 1...6)
    @State var rightDiceNumber = Int.random(in: 1...6)
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack{
                    diceView(number: leftDiceNumber)
                    diceView(number: rightDiceNumber)
                }
                Spacer()
                Button(action:{
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                } ) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
            }
            .padding(.horizontal)
        }
    }
}

struct diceView: View {
    let number: Int
    
    var body: some View {
        Image("dice\(number)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


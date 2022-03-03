//
//  ContentView.swift
//  MemorizeGameAssignment1
//
//  Created by 김재환 on 2022/02/27.
//

import SwiftUI
//state variable 하나 만들고 array의 내용을 바꾸어라
struct ContentView: View {
    @State var emojis = ["🇰🇷", "🇩🇪", "🇯🇵", "🇺🇸", "🇹🇼", "🇮🇳", "🇫🇮", "🇵🇹", "🇨🇮", "🇵🇸", "🇹🇷", "🇰🇬", "🇹🇨", "🇹🇲", "🇨🇷", "🇨🇩", "🇰🇮", "🇬🇧", "🇨🇦", "🇨🇨"]//20개라는것
    
    var countryCount = 16
    var body: some View {
        VStack{
            Text("🤔Memorize🤔").font(.largeTitle)// forgroundColor 색상바꾸는것
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                ForEach(emojis[0..<countryCount], id: \.self){emojis in
                    CardView(content: emojis).aspectRatio(2/3, contentMode: .fit)              .foregroundColor(Color.red)
                        }
                    }
                }
            HStack{
                country
                Spacer()
                animal
                Spacer()
                sports
            }
            }
        .padding(.horizontal)
        }
    var country: some View{
        Button(action: {
           emojis = ["🇰🇷", "🇩🇪", "🇯🇵", "🇺🇸", "🇹🇼", "🇮🇳", "🇫🇮", "🇵🇹", "🇨🇮", "🇵🇸", "🇹🇷", "🇰🇬", "🇹🇨", "🇹🇲", "🇨🇷", "🇨🇩", "🇰🇮", "🇬🇧", "🇨🇦", "🇨🇨"]
            emojis.shuffle()
        }
               , label:{
            VStack{
                Image(systemName: "globe.asia.australia.fill")
                    .font(.system(size: 40))
            }
        })
    }
    var animal: some View{
            Button(action: {
               emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🦆", "🐥"]
                emojis.shuffle()
            }
                   , label:{
                VStack{
                    Image(systemName: "pawprint")
                        .font(.system(size: 40))//이미지도 .font로 사이즈 조절이 가능
                        
                }
            })
    }
    var sports: some View{
            Button(action: {
               emojis = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏑", "🏒", "🥍", "🏏", "🪃", "🥌", "🥊"]
                emojis.shuffle()
            }
                   , label:{
                VStack{
                    Image(systemName: "sportscourt")
                        .font(.system(size: 40))
                }
            })
    }
}


struct CardView: View{
    var content: String
    @State var isFacedUp: Bool = true// @State 를 사용해 ontapgesture 를 계속 바라보고있는것
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFacedUp{
                    shape.fill() .foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
                    .font(.largeTitle)
            }
            else{
                shape.fill()
            }
        }
        .onTapGesture{
            isFacedUp = !isFacedUp // ontapGesture 로 탭의 유무를 판단함
        }
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


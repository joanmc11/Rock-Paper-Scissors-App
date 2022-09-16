//
//  ContentView.swift
//  Rock Paper Scissors App
//
//  Created by Joan Marine Canals on 15/9/22.
//

import SwiftUI


struct ContentView: View {
    @State var choise = ""
    @State var win = false
    @State var draw = false
    @State var start = false
    @State var computerChoise = ""
    @State var list = ["paper","scissors","rock"]
    
    
    var body: some View {
        VStack{
            TopBar()
            Spacer()
            Text("Welome").fontWeight(.bold)
                .padding().font(.largeTitle).foregroundColor(.orange)
            Text("choose your hand: ").fontWeight(.bold).padding().foregroundColor(.orange)
            HStack{
                ZStack{
                    choise == "paper" ? Circle().fill(.orange).frame(width: 100, height: 100, alignment: .center) : nil
                    Image("paper").resizable().frame(width: 80, height: 80, alignment: .center).onTapGesture {
                    self.choise = "paper"
                    }.padding()
                                   }
                
                ZStack{
                    choise == "scissors" ? Circle().fill(.orange).frame(width: 100, height: 100, alignment: .center) : nil
                    Image("scissors").resizable().frame(width: 80, height: 80, alignment: .center).onTapGesture {
                    choise = "scissors"
                    }
                    
                }
                
                ZStack{
                    choise == "rock" ? Circle().fill(.orange).frame(width: 100, height: 100, alignment: .center) : nil
                    
                    Image("rock").resizable().padding().frame(width: 110, height:110, alignment: .center).onTapGesture {
                    choise = "rock"
                    }
                    
            }
            }//HStack
            Spacer()
            
            !start ? nil : (
                draw ? Text("DRAW").fontWeight(.bold).foregroundColor(.orange) : (
                    win ? Text("YOU WIN!!").fontWeight(.bold).foregroundColor(.orange) : Text("YOU LOSE!").fontWeight(.bold).foregroundColor(.orange)                 )
            )
            
            !start ? nil : HStack{
                Text("Computer choise: ").padding().foregroundColor(.orange).font(.subheadline)
                Image(computerChoise).resizable().frame(width: 50, height: 50, alignment: .center)
            }
            
            Button("Play!"){
                start = true
                list.shuffle()
                computerChoise = list[0]
                if(list[0] == choise){
                    draw = true
                    
                }else if(list[0] == "paper"){
                    if(choise == "rock"){
                        draw = false
                        win = false}else{win = true}
                    
                }else if(list[0] == "rock"){
                    draw = false
                    if(choise == "paper"){ win = true}else{ win = false}
                    
                }else{
                    if(choise == "rock"){ win = true}else{win = false}
                    
                }            }.foregroundColor(.white).padding().background(.orange)
            Spacer()
           
            
            
            
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TopBar : View {
    
    var body: some View{
        VStack(spacing: 20){
            
            Text("Rock, Paper, Scissors").font(.system(size: 18)).foregroundColor(.white).fontWeight(.semibold)
            
        }.padding().frame(maxWidth: .infinity).background(.orange)
    }
}

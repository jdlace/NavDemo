//
//  ContentView.swift
//  NavDemo
//
//  Created by Jonathan Lace on 12/12/20.
//

import SwiftUI

class Flotilla: ObservableObject {
    @Published var hours = 0
}

struct DetailView: View {
    
    @EnvironmentObject var flotilla: Flotilla
    
    var body: some View {
        VStack {
            Text("USCGAux Hours: \(flotilla.hours)")
            Button("Add Hours") {
                self.flotilla.hours += 1
            }
        }
        
    }
}

struct ContentView: View {
    
    @ObservedObject var flotilla = Flotilla()
    
    var body: some View {
        NavigationView {
            VStack(spacing:60) {
                Text("     Floitlla 10-20\nAir Station Caldwell")
                    .bold()
                Image("1020")
                    .aspectRatio(contentMode: .fill)
                NavigationLink(destination: DetailView()) {
                    Text("Add Your Service Hours")
                        .bold()
                        }
                Text("You have \(flotilla.hours) Service Hours \nto submit on your Form 7029.\n\n\n\n                  S E M P E R\n                P A R A T U S").bold()
            }.navigationBarTitle("USCG Auxiliary")
           
        } .environmentObject(flotilla)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  PrimerParcialEmmaSahagun
//
//  Created by win603 on 09/09/26.
//

import SwiftUI

struct ContentView: View {
   
    
    var body: some View {
        Text("Departamentos").font(.largeTitle)
            .padding()
        ScrollView(showsIndicators: false) {
                tarjeta(imagen: "depa01", direccion:"Ampliacion, Cd Madero", nombre: "GH Raices | 1F", precio: "$25,000", superficie: "29.02 ", Calificacion: "4.7")
            tarjeta(imagen: "Image", direccion:"Petrolera, Tampico", nombre: "Hmlet Raices | 8F", precio: "$14,960", superficie: "26. 15 ", Calificacion: "---")
            tarjeta(imagen: "Image 1", direccion:"Miralta,Altamira", nombre: "Oak Century | 5F", precio: "$16,400", superficie: "25.08 ", Calificacion: "4.7")
            tarjeta(imagen: "Image 2", direccion:"Los Mangos, Madero", nombre: "Fontana SH | 4F", precio: "$17,300", superficie: "27.22", Calificacion: "4.6")
            tarjeta(imagen: "Image 3", direccion:"Grossman, Altamira", nombre: "Homestay Iest| 4F", precio: "$18,500", superficie: "25.74 ", Calificacion: "5.0")
            
        }
        
    }
}

#Preview {
    ContentView()
}
func tarjeta(
        imagen: String,
        direccion: String,
        nombre: String,
        precio: String,
        superficie: String,
        Calificacion: String,
        //puede que no sirva
       @State esfav: Bool = false,
       @State esreserv: Bool = true,
        @State  testo: String = "Reservar",
        @State icon1: String = "heart",
        @State  icon2: String = "house"
        
       )             -> some View {
          
           ZStack{
               VStack(alignment: .leading){
                   Image(imagen)
                       .resizable()
                       .scaledToFit()
                       .clipShape(RoundedRectangle(cornerRadius:12)).padding(10)
                       .overlay(
                        VStack(alignment: .center){
                            HStack{
                                HStack(alignment: .center, spacing: -1){
                                    Image(systemName: "location")
                                    Text(direccion).font(.system(size: 12)).padding(6)
                                }.padding(.horizontal).background(Color.black).opacity(0.5).clipShape(Capsule())
                                Spacer(minLength: 10)
                                HStack(alignment: .top){
                                    
                                    Image(systemName: "\(icon1)").onTapGesture {
                                        if esfav == true {
                                            icon1 = "heart.fill"
                                           esfav = false
                                        }else{
                                            icon1 = "heart"
                                            esfav = true
                                        }
                                    }
                                }.padding().background(Color.black).opacity(0.5).clipShape(Capsule()).foregroundStyle(Color.white)
                            }.padding(20)
                            Spacer()
                                HStack(alignment: .center){
                                    Button(
                                        action: {
                                            if esreserv == true {
                                                icon2 = "xmark"
                                                testo = "Cancelar"
                                               esreserv = false
                                            }else{
                                                testo = "Reservar"
                                                icon2 = "house"
                                                esreserv = true
                                            }
                                        }
                                    ){
                                        Label("", systemImage: "\(icon2)")
                                        Text("\(testo)")
                                    }.padding(.horizontal).background(Color.reserva).clipShape(Capsule())
                                    
                                    
                               }.padding(25)
                        }.foregroundStyle(Color.white)
                       )
                   Spacer(minLength: 8)
                   VStack{
                       HStack{
                           Text(nombre)
                           Spacer()
                           Image(systemName: "star.fill").foregroundStyle(Color.yellow)
                           Text(Calificacion)
                       }
                       HStack{
                           Text(precio).font(.system(size: 18,weight: .bold))
                           Text("al mes")
                           Spacer()
                           Text(superficie).foregroundStyle(Color.gray)
                           Text("m2").foregroundStyle(Color.gray)
                       }
                       
                   }.padding()
               }.frame(width: 400,height: 400)
              
           }.ignoresSafeArea()
        
        }

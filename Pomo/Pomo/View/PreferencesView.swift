//
//  PreferencesView.swift
//  Pomo
//
//  Created by João Medeiros on 05/11/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct PreferencesView: View {
    @State private var profileName: String = "João Gabriel A."
    @State private var bioText: String = "Só agradece 🙏🏼"
    var body: some View {
        NavigationView {
            VStack() {
                Image("mepic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .clipShape(Circle())
                Text(profileName)
                    .font(.title2).bold()
                Text(bioText)
                    .font(.callout)
                    .padding(.top, 5)
                Divider()
                Spacer()
                
                Button(action: {}) {
                    ZStack {
                        Capsule().frame(width: 300, height: 50)
                        Text("Edit Profile")
                            .foregroundColor(.primary)
                    }
                    .foregroundColor(Color(.systemGray4))
                    
                }
                .padding(.vertical, 25)
                
                    .navigationTitle("Preferences")
            }
        }
    }
}

@available(iOS 14.0, *)
struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}

struct ChangePreferencesView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(fetchRequest: SessionItem.getAllSessionItems()) var sessionItems: FetchedResults<SessionItem>
    @Binding var showAddModal: Bool
    @Binding var name: String
    @Binding var description: String
    @Binding var icon: String
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name of your Focus Session", text: self.$name)
                TextField("Description of your Focus Session", text: self.$description)
                TextField("Icon of your Focus Session", text: self.$icon)
                    

                    .navigationBarTitle("New Session", displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {
                        withAnimation {
                            self.showAddModal.toggle()
                            self.hideKeyboard()
                        }
                    }) {
                        Text("Cancel")
                        }, trailing: Button(action: {
                            let sessionItem = SessionItem(context: self.moc)
                            sessionItem.name = self.name
                            sessionItem.sessionDescription = self.description
                            sessionItem.icon = (self.icon).lowercased()
                            
                            do {
                                try self.moc.save()
                            } catch {
                                print(error)
                            }
                            withAnimation {
                                self.showAddModal.toggle()
                            }
                            self.hideKeyboard()
                        }) {
                            Text("Next")
                })
            }
        }
        .accentColor(.red)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .padding(.vertical, 50)
//        .background(Color(#colorLiteral(red: 0.9488552213, green: 0.9487094283, blue: 0.9693081975, alpha: 1)))
//        .edgesIgnoringSafeArea(.all)
//        .offset(x: 0, y: showAddModal ? 0 : UIScreen.main.bounds.height)
    }
}

//
//  SessionView.swift
//  Pomo
//
//  Created by João Medeiros on 17/05/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct SessionView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(fetchRequest: SessionItem.getAllSessionItems()) var sessionItems: FetchedResults<SessionItem>
    @State var showAddModal = false
    @State private var name = ""
    @State private var description = ""
    @State private var icon = ""
    @State private var isDeleted = false
    @State private var showEllipsisModal = false
    @Namespace private var namespace
    @State private var searchText: String = ""
    
    var columns = [
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading) {
                        TextField("Search", text: $searchText)
                            .padding(7)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(7)
                        
                        LazyVGrid(columns: columns) {
                            ForEach(sessionItems) { card in
                                ZStack {
                                    SessionCardView(session: card)
                                        .contextMenu {
                                            Button(action: {
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                    let deletedItem = self.sessionItems[self.sessionItems.firstIndex(of: card) ?? -1]
                                                    self.moc.delete(deletedItem)
                                                    
                                                    do {
                                                        try self.moc.save()
                                                    } catch {
                                                        print(error)
                                                    }
                                                    self.isDeleted = true
                                                }
                                            }) {
                                                HStack {
                                                    Text("Delete")
                                                }
                                            }
                                        }
                                    
                                    EllipsisView()
                                    .padding(15)
                                    .onTapGesture {
                                        self.showEllipsisModal.toggle()
                                    }.fullScreenCover(isPresented: $showEllipsisModal) {
                                        HStack {
                                            Text("this is a modal view")
                                            Button(action: { showEllipsisModal.toggle() }) {
                                                Text("Dismiss")
                                                    .foregroundColor(.white)
                                            }
                                            .padding()
                                            .background(Color.blue)
                                            .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        .animation(.spring(response: 0.6, dampingFraction: 0.75, blendDuration: 0))
                    }
                    .navigationBarTitle("Sessions")
                    .navigationBarItems(trailing: Button(action: {
                        withAnimation {
                            self.showAddModal.toggle()
                        }
                        
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 30))
                })
                }
                .padding(.top, 0.3)
            }.fullScreenCover(isPresented: $showAddModal) {
                AddModalView(showAddModal: $showAddModal, name: $name, description: $description, icon: $icon)
                    .environment(\.managedObjectContext, moc)
            }
            
        }
        
    }
}

@available(iOS 14.0, *)
struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        SessionView()
    }
}

struct SessionCardView: View {
    var session: SessionItem
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: session.icon!)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                Spacer()
//                Image(systemName: "ellipsis")
//                    .font(.system(size: 18))
//                    .foregroundColor(.white)
//                    .frame(width: 25, height: 25)
//                    .background(Color.white.opacity(0.4))
//                    .clipShape(Circle())
            }
            Spacer()
            Text(session.name!)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            Text(session.sessionDescription!)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color.white.opacity(0.7))
        }
        .frame(maxWidth: 135)
        .frame(maxHeight: 100)
        .padding(15)
        .background(Color(colors.randomElement()!))
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
}

struct AddModalView: View {
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

struct EllipsisView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: "ellipsis")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .frame(width: 26, height: 26)
                    .background(Color.white.opacity(0.4))
                    .clipShape(Circle())
                Spacer()
            }
        }
    }
}

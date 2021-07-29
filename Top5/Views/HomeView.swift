//
//  HomeView.swift
//  Top5
//
//  Created by Arsalan Iravani on 26.07.2021.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @ObservedObject var vm = HomeViewModel()
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    
    var body: some View {
        NavigationView {
            
            Group {
                switch vm.recommendationProgressState {
                case .none:
                    List(vm.recommendations) { recommendation in
                        RecommendationView(recommendation: recommendation, image: UIImage())
                    }
                    
                case .empty:
                    Spacer()
                    Text("No flights are available")
                    Spacer()
                    
                case .loading:
                    Spacer()
                    HStack {
                        ProgressView()
                    }
                    Spacer()
                    
                case .error:
                    Spacer()
                    Text("Error occured")
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("✈️ Flight Offers ")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        vm.refreshButtonPressed()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                    
                }
            }
            
        }
        .onAppear {
            vm.downloadRecommendations()
        }
    }
    
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

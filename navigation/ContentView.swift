
import SwiftUI
import Dependencies

struct ContentView: View {
    @StateObject var router = Router.liveValue
    
    var body: some View {
        ZStack {
            AlertFactory(item: $router.alert, store: .init(
                initialState: AlertReducer.State(show: true),
                reducer: AlertReducer()
            ))
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            TabView(selection: $router.tab) {
                NavigationStack(path: $router.homePath) {
                    HomeView(store:
                            .init(
                                initialState: Home.State(),
                                reducer: Home()
                            )
                    )
                    .environmentObject(router)
                    .navigationDestination(for: String.self) { path in
                        Text(path)
                    }
                }
                .tabItem { Text("Home") }
                .tag(Tabs.home)
                NavigationStack(path: $router.serchPath) {
                    SearchView(
                        store: .init(
                            initialState: Search.State(),
                            reducer: Search()
                        )
                    )
                    .environmentObject(router)
                    .navigationDestination(for: String.self) { person in
                        Text(person)
                    }
                }
                .tabItem { Text("Serach") }
                .tag(Tabs.search)
            }.popover(item: $router.popup) { item in
                PopoverFactory(item: item)
            }

        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

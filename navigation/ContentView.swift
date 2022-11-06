
import SwiftUI
import Dependencies

struct ContentView: View {
    @StateObject var router = Router.liveValue
    
    var body: some View {
        TabView(selection: $router.tab) {
            
            NavigationStack(path: $router.homePath) {
                HomeView()
                    .environmentObject(router)
                    .navigationDestination(for: String.self) { path in
                        Text(path)
                    }
            }
            .tabItem { Text("Home") }
            .tag(Tabs.home)
            
            
            NavigationStack(path: $router.serchPath) {
                SearchView(
                    store:
                            .init(initialState: Search.State(),
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
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


public class Router: ObservableObject, DependencyKey {
    public static var liveValue: Router = Router()
    
    private init() {}
    
    @Published var homePath = NavigationPath()
    @Published var serchPath = NavigationPath()
    @Published var tab = Tabs.home
    
}

enum Tabs {
    case home
    case search
    case profile
}


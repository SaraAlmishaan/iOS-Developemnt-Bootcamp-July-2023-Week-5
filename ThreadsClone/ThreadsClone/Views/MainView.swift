//  MainView.swift
//  ThreadsClone
//  Created by Sara on 20/08/2023.
import SwiftUI

struct MainView: View {
    
    enum Screen : String, CaseIterable{
        case Home
        case Search
        case NewPost
        case Activity
        case Profile
        
        var title : String{
            switch self {
            case .Home : return "Home"
            case .Search : return "Search"
            case .NewPost : return "New Post"
            case .Activity : return "Activity"
            case .Profile: return "Profile"
            }
        }
        var systemImage : String{
            switch self {
            case .Home : return "house"
            case .Search : return "magnifyingglass"
            case .NewPost : return "square.and.pencil"
            case .Activity : return "heart"
            case .Profile: return "person"
            }
        }
        var views : AnyView{
            switch self {
            case .Home : return AnyView(HomeView())
            case .Search : return AnyView(SearchView())
            case .NewPost : return AnyView(NewPostView())
            case .Activity : return AnyView(ActivityView())
            case .Profile: return AnyView(ProfileView())
            }
        }
    }
    @State var currentTitle : String = ""
     var body: some View {
         NavigationView{
             TabView{
                 ForEach(Screen.allCases, id : \.self){ screen in
                     screen.views
                         .tabItem {
                             Label(screen.title, systemImage: screen.systemImage)
                         }.onAppear(){
                             currentTitle  = screen.title
                         }
                 }
             }.navigationTitle(currentTitle)
              .navigationBarBackButtonHidden(true)
         }
      }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

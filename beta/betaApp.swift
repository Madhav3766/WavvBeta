import SwiftUI
import FirebaseCore

// Define the AppDelegate for Firebase setup
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("Firebase configured")
        return true
    }
}

@main
struct betaApp: App {
    // Register the app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView() // Set ContentView as the initial view
            }
        }
    }
}


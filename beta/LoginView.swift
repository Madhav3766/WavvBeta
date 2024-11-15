import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSignedIn = false // Track sign-in status
    
    var body: some View {
        NavigationView {
            VStack {
                // Logo at the top
                Image("logo_wavv")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 265, height: 138)
                    .padding(.top, 100)
                
                Spacer()

                // Scrollable Content
                ScrollView {
                    VStack(spacing: 30) {
                        // Email Input
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Email")
                                .font(.custom("Lexend", size: 24))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            TextField("Enter email address", text: $email)
                                .padding()
                                .background(Color(red: 68/255, green: 68/255, blue: 68/255))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .frame(width: 300)
                        }

                        // Password Input
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Password")
                                .font(.custom("Lexend", size: 24))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            SecureField("Enter Password", text: $password)
                                .padding()
                                .background(Color(red: 68/255, green: 68/255, blue: 68/255))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .frame(width: 300)
                        }
                    }
                }
                
                Spacer()

                // Buttons at the bottom
                VStack(spacing: 30) {
                    Button(action: {
                        // Handle regular login action
                        print("Regular sign-in clicked")
                    }) {
                        Text("Let's get grooving")
                            .font(.custom("Lexend", size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .frame(width: 300, height: 50)
                            .background(Color(white: 1, opacity: 0.8))
                            .cornerRadius(25)
                    }
                    
                    Button(action: {
                        handleGoogleSignIn()
                    }) {
                        Text("Sign in with Google")
                            .font(.custom("Lexend", size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .frame(width: 300, height: 50)
                            .background(Color(white: 1, opacity: 0.8))
                            .cornerRadius(25)
                    }
                }
                .padding(.bottom, 40)
                
                // NavigationLink to DancingBeatsView
                NavigationLink(destination: DancingBeatsView(), isActive: $isSignedIn) {
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "1E1E1E"))
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Login")
            .navigationBarHidden(true)
        }
    }

    // Google Sign-In Handler
    func handleGoogleSignIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            print("Error: Firebase Client ID not found")
            return
        }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Get the root view controller dynamically
        guard let rootViewController = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first?.windows.first?.rootViewController else {
            print("Error: Root view controller not found")
            return
        }

        // Start the Google Sign-In flow
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            if let error = error {
                print("Google Sign-In Error: \(error.localizedDescription)")
                return
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                print("Error: Google Sign-In did not return a valid user or token")
                return
            }

            // Create Firebase Authentication credential
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)

            // Sign in to Firebase
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase Sign-In Error: \(error.localizedDescription)")
                    return
                }

                // Handle successful login
                print("Success: User signed in with Firebase")
                isSignedIn = true // Set to true to trigger navigation
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let red = Double((rgbValue >> 16) & 0xff) / 255
        let green = Double((rgbValue >> 8) & 0xff) / 255
        let blue = Double(rgbValue & 0xff) / 255
        self.init(red: red, green: green, blue: blue)
    }
}


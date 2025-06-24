//
//  LoginScreen.swift
//  ECommerceApp
//
//  Created by Anil Kumar on 20/06/25.
//

 
import SwiftUI
import FirebaseAuth
import Firebase
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices
import CryptoKit
import CoreData
 
struct SignupScreen: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    private let appleLoginManager = AppleSignInManager()
    
    @State private var userName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isNavigate = false
    
    @State private var navigateToHomeFromEmail = false
    @State private var navigateToHomeFromGoogle = false
    
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image("signup")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 175, height: 175)
                        .padding(.top)
                    
                    Text("Login to continue")
                        .padding()
                        .font(.headline)
                        .foregroundColor(.black.opacity(0.5))
                }
                
                VStack(spacing: 20) {
                    CustomTextField(icon: "person.fill", placeholder: "User Name", text: $userName)
                    CustomTextField(icon: "envelope.fill", placeholder: "Email", text: $email)
                    CustomTextField(icon: "lock.fill", placeholder: "Password", text: $password)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(radius: 2)
                .padding(.horizontal)
                
                
                
                HStack{
                    Text("All ready have an account? ")
                        .font(.headline)
                        .bold()
                    
                    NavigationLink(
                        destination: LoginView(),
                        isActive: $isNavigate
                    ) {
                        EmptyView()
                    }
                    Button(action: {
                        isNavigate = true
                    }){
                        Text("Login")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.blue)
                    }
                }
                
                VStack(spacing: 20) {
                    
                    
                    
                    // Register Button
                    Button(action: {
                        registerWithEmail()
                    }) {
                        Text("Register")
                            .frame(width: 258, height: 22)
                            .padding()
                            .bold()
                            .background(Color.green.opacity(0.2))
                            .foregroundColor(.black.opacity(0.7))
                            .font(.headline)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                    }
                    
                    HStack(spacing: 20) {
                        // Google Sign-In
                        Button(action: {
                            handleGoogleSignIn()
                        }) {
                            Image("google")
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                        .frame(width: 70, height: 22)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                        
                        // Apple Sign-In
                        Button(action: {
                            appleLoginManager.startSignInWithAppleFlow()
                        }) {
                            Image("apple")
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                        .frame(width: 70, height: 22)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                    }
                }
                .padding(.top, 70)
            }
            .padding()
            .navigationDestination(isPresented: $navigateToHomeFromEmail) {
                TabBarView().environment(\.managedObjectContext, viewContext)
            }
            .navigationDestination(isPresented: $navigateToHomeFromGoogle) {
                TabBarView().environment(\.managedObjectContext, viewContext)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
 
    // MARK: - Email Register
    func registerWithEmail() {
        guard isValidEmail(email), !password.isEmpty else {
            print("Invalid email or password.")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Registration failed: \(error.localizedDescription)")
                return
            }
            
            print("User registered!")
            navigateToHomeFromEmail = true
        }
    }
    
    // MARK: - Email Format Validator
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
    
    // MARK: - Google Sign-In
    func handleGoogleSignIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            print("❌ No Firebase clientID")
            return
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootVC = windowScene.windows.first?.rootViewController else {
            print("❌ No root VC")
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootVC) { signInResult, error in
            if let error = error {
                print("❌ Google sign-in error: \(error.localizedDescription)")
                return
            }
            
            guard let user = signInResult?.user,
                  let idToken = user.idToken?.tokenString else {
                print("❌ Token error")
                return
            }
            
            let accessToken = user.accessToken.tokenString
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase sign-in failed: \(error.localizedDescription)")
                    return
                }
                
                print("Google sign-in successful!")
                navigateToHomeFromGoogle = true
            }
        }
    }
    
//    func saveUserToCoreData(name: String, email: String, phone: String) {
//        let user = UserProfile(context: viewContext)
//        user.name = name
//        user.email = email
//        user.phone = phone
//
//        do {
//            try viewContext.save()
//            print("User saved to Core Data")
//        } catch {
//            print("Failed to save user: \(error)")
//        }
//    }
}
 
// MARK: - Apple Sign-In Manager (Stub)
@available(iOS 13.0, *)
class AppleSignInManager: NSObject {
    func startSignInWithAppleFlow() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
 
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
}
 
@available(iOS 13.0, *)
extension AppleSignInManager: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIWindow()
    }
 
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        print("✅ Apple Sign-In success (implement logic here)")
    }
 
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("❌ Apple Sign-In Failed: \(error.localizedDescription)")
    }
}
 

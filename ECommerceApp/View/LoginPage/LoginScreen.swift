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
import CoreData
import AuthenticationServices
import CryptoKit

class UserSession: ObservableObject {
    static let shared = UserSession()

    @Published var name: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""

    private init() { }
}
 
struct LoginView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    private let appleLoginManager = AppleSignInManager()
    
//    @State private var userName = ""
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
                    Image("login")
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
//                    CustomTextField(icon: "person.fill", placeholder: "User Name", text: $userName)
                    CustomTextField(icon: "envelope.fill", placeholder: "Email", text: $email)
                    CustomTextField(icon: "lock.fill", placeholder: "Password", text: $password)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(radius: 2)
                .padding(.horizontal)
                
                    
                HStack{
                    Text("You don't have an account? ")
                        .font(.headline)
                        .bold()
                    
                    NavigationLink(
                        destination: SignupScreen(),
                        isActive: $isNavigate
                    ) {
                        EmptyView()
                    }
                    Button(action: {
                        isNavigate = true
                    }){
                        Text("Register")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.blue)
                    }
                }
                
                
                VStack(spacing: 20) {
                    // Login Button
                    Button(action: {
                        loginWithEmail()
                    }) {
                        Text("Login")
                            .frame(width: 258, height: 22)
                            .padding()
                            .bold()
                            .background(Color.blue.opacity(0.2))
                            .foregroundColor(.black.opacity(0.7))
                            .font(.headline)
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
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // MARK: - Email Login
    func loginWithEmail() {
        guard isValidEmail(email), !password.isEmpty else {
            print("Invalid email or password.")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Login failed: \(error.localizedDescription)")
                return
            }
            
            print("Login successful!")
//            fetchUserFromCoreData(email: email)
            navigateToHomeFromEmail = true
        }
    }
//    func fetchUserFromCoreData(email: String) {
//        let fetchRequest: NSFetchRequest<UserProfile> = UserProfile.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
//
//        do {
//            if let user = try viewContext.fetch(fetchRequest).first {
//                UserSession.shared.name = user.name ?? ""
//                UserSession.shared.email = user.email ?? ""
//                UserSession.shared.phone = user.phone ?? ""
//            }
//        } catch {
//            print("Error fetching user: \(error)")
//        }
//    }
    
    func saveUserToCoreData(name: String, email: String, phone: String) {
        let user = UserProfile(context: viewContext)
        user.name = name
        user.email = email
        user.phone = phone

        do {
            try viewContext.save()
            print("✅ User saved")
        } catch {
            print("❌ Failed to save user: \(error)")
        }
    }

    

    
    // MARK: - Email Format Validator
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
    
}

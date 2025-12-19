import FirebaseAuth
import Foundation

@Observable
class MainScreenVM {
    var userId: String = ""
    var isSignedIn: Bool = false
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.userId = Auth.auth().currentUser?.uid ?? ""
        self.isSignedIn = Auth.auth().currentUser != nil
        
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.userId = user?.uid ?? ""
                self?.isSignedIn = user != nil
            }
        }
    }
    
    deinit {
        if let handler = handler {
            Auth.auth().removeStateDidChangeListener(handler)
        }
    }
}

import FirebaseAuth
import Foundation

@Observable
class MainScreenVM {
    
    var userId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
     
    init() {
        self.userId = Auth.auth().currentUser?.uid ?? ""
        
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.userId = user?.uid ?? ""
            }
        }
    }
    
    deinit {
        if let handler = handler {
            Auth.auth().removeStateDidChangeListener(handler)
        }
    }
    
    public var isSingedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}

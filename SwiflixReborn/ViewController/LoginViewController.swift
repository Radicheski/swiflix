import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = Auth.auth().currentUser {
            self.showMainScreen()
        }
    }
    
    @IBAction func enterClicked(_ sender: UIButton) {
        self.authenticate()
    }
    
    @IBAction func forgetPasswordClicked(_ sender: UIButton) {
        self.showPasswordRecoveryForm()
    }
    
    func authenticate() {
        
        if let email = self.emailField.text,
           let password = self.passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let _ = result {
                    self.showMainScreen()
                } else if let error = error as NSError? {
                    let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                        alert.dismiss(animated: true, completion: nil)
                    }))
                    self.present(alert, animated: true)
                }
            }
        }
        
    }
    
    func showMainScreen() {
        self.performSegue(withIdentifier: "LoginToMain", sender: nil)
    }
    
    func showPasswordRecoveryForm() {
        self.performSegue(withIdentifier: "LoginToPasswordRecovery", sender: nil)
    }
    
}

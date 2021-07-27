//
//  LoginViewController.swift
//  MikeIOS
//
//  Created by 殷聃 on 2021/4/25.
//

import UIKit
import Amplify
import AWSMobileClientXCF
import AWSCognitoAuthPlugin
import SafariServices
import AWSPluginsCore
enum AuthProvider:String {
    case signInWithApple
}
class LoginViewController: UIViewController {
    @IBOutlet weak var loginBtn:UIButton!
    @IBOutlet weak var appleLoginBtn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        // Do any additional setup after loading the view.
    }
    func configView(){
        self.view.backgroundColor = orangeColor
        self.appleLoginBtn.layer.cornerRadius = 5
    }

    @IBAction func loginBtnPressed(){
        let secondVC = LoginSecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    @objc func appleLoginPressed(){
        let dic:NSDictionary = JsonHelper.convertJsonFileToDic(fileName: "amplifyconfiguration")
        guard let sdic = dic["auth"] as? NSDictionary else{
            return
        }
        guard let pdic = sdic["plugins"] as? NSDictionary else{
            return
        }
        guard let awsPluginDic = pdic["awsCognitoAuthPlugin"] as? NSDictionary else {
            return
        }
        guard let authdic = awsPluginDic["Auth"] as? NSDictionary else{
            return
        }
        guard let defaultDic = authdic["Default"] as? NSDictionary else{
           return
        }
        guard let oauthDic = defaultDic["OAuth"] as? NSDictionary else{
           return
        }
        print("OAuthDic:\(oauthDic)")
        guard let scopes = oauthDic["Scopes"] as? NSArray else{
           return
        }
        print("scopes:\(scopes)")
//        let url:String = "https://\(oauthDic["WebDomain"] ?? "")/login?client_id=\(oauthDic["AppClientId"] ?? "")&response_type=code&redirect_uri=mike://"
//        print("\(url)");//&scope=\(scopes.componentsJoined(by: "+"))
//        UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
//        let safariVc = AppleLoginViewController(url: URL(string: url)!)
//        safariVc.delegate = self
//        self.present(safariVc, animated: true, completion: nil)
        
//        let appleIDProvider = ASAuthorizationAppleIDProvider()
//        let request:ASAuthorizationAppleIDRequest = appleIDProvider.createRequest()
//        request.requestedScopes = [ASAuthorization.Scope.fullName,ASAuthorization.Scope.email]
//        let controller:ASAuthorizationController = ASAuthorizationController(authorizationRequests: [request])
//        controller.delegate = self
//        controller.presentationContextProvider = self
//        controller.performRequests()
//        Amplify.Auth.signOut()
        let hostedUIOptions = HostedUIOptions(scopes: ["openid", "email"],identityProvider: "SignInWithApple")

        // Present the Hosted UI sign in.
        AWSMobileClient.default().showSignIn(navigationController: self.navigationController!, hostedUIOptions: hostedUIOptions) { (userState, error) in
            if let error = error as? AWSMobileClientError {
                print(error.localizedDescription)
            }
            if let userState = userState {
                print("Status: \(userState.rawValue)")
            }
        }
//        Amplify.Auth.signInWithWebUI(for: .apple, presentationAnchor: self.view.window!) { result in
//                       switch result {
//                       case .success:
//                           print("Sign in succeeded")
//                       case .failure(let error):
//                           print("Sign in failed \(error)")
//                       }
//                   }
    }
    public func fetchSession(suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.Auth.fetchAuthSession { result in
            do {
                let session = try result.get()
                // Get user sub or identity id
                if let identityProvider = session as? AuthCognitoIdentityProvider {
                    let usersub = try identityProvider.getUserSub().get()
                    let identityId = try identityProvider.getIdentityId().get()
                    print("User sub - \(usersub) and identity id \(identityId)")
//                    self.fetchUserProfile(userId: usersub, suc: suc, fail: fail)
                }else{
                    print("Fetch auth session failed")
                    fail("Fetch auth session failed")
                }
            } catch {
                print("Fetch auth session failed with error - \(error)")
                fail("\(error)")
            }
        }
    }
    func signIn(with userId:String){
        guard
            let plugin = try? Amplify.Auth.getPlugin(for: AWSCognitoAuthPlugin().key),
            let authPlugin = plugin as? AWSCognitoAuthPlugin,
            case .awsMobileClient(let client) = authPlugin.getEscapeHatch()
        else {
            return
        }
        client.federatedSignIn(
            providerName: AuthProvider.signInWithApple.rawValue,
            token: userId
        ) { state, error in
            if let unwrappedError = error{
                print(unwrappedError)
            }else if let unwrappedState = state{
                print("Successful federated sign in:",unwrappedState)
                self.fetchSession {
                    
                } fail: { error in
                    
                }

            }
        }
    }
    @IBAction func registerBtnPressed(){
        let secondVC = RegisterViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension LoginViewController:ASAuthorizationControllerDelegate,ASAuthorizationControllerPresentationContextProviding{
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return keyWindow ?? UIWindow()
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIdCredential = authorization.credential as? ASAuthorizationAppleIDCredential{
            DispatchQueue.main.async {
                print(appleIdCredential.authorizationCode
                        ?? "")
                let identityToken = NSString(data: appleIdCredential.identityToken ?? Data(), encoding: 0)
                let userId = appleIdCredential.user
                self.signIn(with: (identityToken ?? "") as String)
            }
        }
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        
    }
}
extension LoginViewController:SFSafariViewControllerDelegate{
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        
    }
    func safariViewController(_ controller: SFSafariViewController, initialLoadDidRedirectTo URL: URL) {
        
    }
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        
    }
}

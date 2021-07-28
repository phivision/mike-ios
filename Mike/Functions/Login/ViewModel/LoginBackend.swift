//
//  LoginBackend.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/15.
//

import UIKit
import Amplify
import AWSCognitoAuthPlugin
import AWSMobileClientXCF
import AWSAPIPlugin
import AWSPinpointAnalyticsPlugin
import AWSPluginsCore
import AWSS3StoragePlugin
import AWSS3
class LoginBackend: NSObject {
    static let shared = LoginBackend()
    static func initialize() -> LoginBackend {
        return .shared
    }
    // signin with Cognito web user interface
    public func signIn() {

        _ = Amplify.Auth.signInWithWebUI(presentationAnchor: UIApplication.shared.windows.first!) { result in
            switch result {
            case .success(_):
                print("Sign in succeeded")
            case .failure(let error):
                print("Sign in failed \(error)")
            }
        }
    }
    // sign in with apple
    public func signInWithApple(suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void,confirmSignUp:@escaping ()->Void){
        Amplify.Auth.signInWithWebUI(for: .apple, presentationAnchor: keyWindow!,options: AuthWebUISignInRequest.Options(scopes: ["email","openid","aws.cognito.signin.user.admin","profile"], signInQueryParameters: ["ResponseType":"Code"])) { result in
            do {
                let signinResult = try result.get()
                switch signinResult.nextStep {
                case .confirmSignInWithSMSMFACode(let deliveryDetails, let info):
                    print("SMS code send to \(deliveryDetails.destination)")
                    print("Additional info \(String(describing: info))")

                    // Prompt the user to enter the SMSMFA code they received
                    // Then invoke `confirmSignIn` api with the code

                case .confirmSignInWithCustomChallenge(let info):
                    print("Custom challenge, additional info \(String(describing: info))")

                    // Prompt the user to enter custom challenge answer
                    // Then invoke `confirmSignIn` api with the answer

                case .confirmSignInWithNewPassword(let info):
                    print("New password additional info \(String(describing: info))")

                    // Prompt the user to enter a new password
                    // Then invoke `confirmSignIn` api with new password

                case .resetPassword(let info):
                    print("Reset password additional info \(String(describing: info))")

                    // User needs to reset their password.
                    // Invoke `resetPassword` api to start the reset password
                    // flow, and once reset password flow completes, invoke
                    // `signIn` api to trigger signin flow again.

                case .confirmSignUp(let info):
                    print("Confirm signup additional info \(String(describing: info))")
                    confirmSignUp()
                    // User was not confirmed during the signup process.
                    // Invoke `confirmSignUp` api to confirm the user if
                    // they have the confirmation code. If they do not have the
                    // confirmation code, invoke `resendSignUpCode` to send the
                    // code again.
                    // After the user is confirmed, invoke the `signIn` api again.
                case .done:
                    // Use has successfully signed in to the app
                    print("Sign in succeeded \(result)")
                    self.fetchSession(suc: suc, fail: fail)
                }
            } catch {
                print ("Sign in failed \(error)")
                fail("\(error)")
            }
        }
    }
    //  login with userName and password
    public func login(userName:String!,pwd:String!,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void,confirmSignUp:@escaping ()->Void){
//        signOut()
        _ = Amplify.Auth.signIn(username: userName, password: pwd) { result in
            do {
                let signinResult = try result.get()
                switch signinResult.nextStep {
                case .confirmSignInWithSMSMFACode(let deliveryDetails, let info):
                    print("SMS code send to \(deliveryDetails.destination)")
                    print("Additional info \(String(describing: info))")

                    // Prompt the user to enter the SMSMFA code they received
                    // Then invoke `confirmSignIn` api with the code

                case .confirmSignInWithCustomChallenge(let info):
                    print("Custom challenge, additional info \(String(describing: info))")

                    // Prompt the user to enter custom challenge answer
                    // Then invoke `confirmSignIn` api with the answer

                case .confirmSignInWithNewPassword(let info):
                    print("New password additional info \(String(describing: info))")

                    // Prompt the user to enter a new password
                    // Then invoke `confirmSignIn` api with new password

                case .resetPassword(let info):
                    print("Reset password additional info \(String(describing: info))")

                    // User needs to reset their password.
                    // Invoke `resetPassword` api to start the reset password
                    // flow, and once reset password flow completes, invoke
                    // `signIn` api to trigger signin flow again.

                case .confirmSignUp(let info):
                    print("Confirm signup additional info \(String(describing: info))")
                    confirmSignUp()
                    // User was not confirmed during the signup process.
                    // Invoke `confirmSignUp` api to confirm the user if
                    // they have the confirmation code. If they do not have the
                    // confirmation code, invoke `resendSignUpCode` to send the
                    // code again.
                    // After the user is confirmed, invoke the `signIn` api again.
                case .done:
                    // Use has successfully signed in to the app
                    print("Sign in succeeded \(result)")
                    self.fetchSession(suc: suc, fail: fail)
                }
            } catch {
                print ("Sign in failed \(error)")
                fail("\(error)")
            }
//            switch result {
//            case .success:
//                if case .confirmSignInWithCustomChallenge(_) = result.nextStep {
//                                // Ask the user to enter the custom challenge.
//                } else {
//                    print("Sign in succeeded \(result)")
//                    self.fetchSession(suc: suc, fail: fail)
//                }
//
//            case .failure(let error):
//                print("Sign in failed \(error)")
//                fail(error.errorDescription)
//            }
        }
    }
    
    //MARK: - register
    func signUp(username: String, password: String, firstName: String,lastName: String,userRole:String,needConfirm:@escaping ()->Void,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void) {
        let userAttributes = [
            AuthUserAttribute(.custom("role"),value: userRole),
            AuthUserAttribute(.custom("first_name"), value: firstName),
            AuthUserAttribute(.custom("last_name"), value: lastName),
        ]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        Amplify.Auth.signUp(username: username, password: password, options: options) { result in
            switch result {
            case .success(let signUpResult):
                if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
                    print("Delivery details \(String(describing: deliveryDetails))")
                    needConfirm()
                } else {
                    print("SignUp Complete")
                    suc()
                }
            case .failure(let error):
                print("An error occurred while registering a user \(error)")
                fail("\(error)")
            }
        }
    }
    func resendCodeForSignUp(username: String,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void) {
        Amplify.Auth.resendSignUpCode(for: username){ result in
            switch result {
            case .success:
                print("Confirm signUp succeeded")
                suc()
            case .failure(let error):
                print("An error occurred while confirming sign up \(error)")
                fail("\(error)")
            }
        }
    }
    // confirmSignUp
    func confirmSignUp(for username: String, with confirmationCode: String,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void) {
        Amplify.Auth.confirmSignUp(for: username, confirmationCode: confirmationCode) { result in
            switch result {
            case .success:
                print("Confirm signUp succeeded")
                suc()
            case .failure(let error):
                print("An error occurred while confirming sign up \(error)")
                fail("\(error)")
            }
        }
    }

    //MARK: - fogotPwd
    func resetPassword(username: String,needConfirm:@escaping ()->Void,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void) {
        Amplify.Auth.resetPassword(for: username) { result in
                do {
                    let resetResult = try result.get()
                    switch resetResult.nextStep {
                    case .confirmResetPasswordWithCode(let deliveryDetails, let info):
                        print("Confirm reset password with code send to - \(deliveryDetails) \(String(describing: info))")
                        needConfirm()
                    case .done:
                        print("Reset completed")
                        suc()
                    }
                } catch {
                    print("Reset password failed with error \(error)")
                    fail("\(error)")
                }
            }
    }
    
    func confirmResetPassword(
        username: String,
        newPassword: String,
        confirmationCode: String,
        suc:@escaping ()->Void,
        fail:@escaping (_ msg:String)->Void
    ) {
        Amplify.Auth.confirmResetPassword(
            for: username,
            with: newPassword,
            confirmationCode: confirmationCode
        ) { result in
            switch result {
            case .success:
                print("Password reset confirmed")
                suc()
            case .failure(let error):
                print("Reset password failed with error \(error)")
                fail("\(error)")
            }
        }
    }
    
    //MARK:  - signout
    public func signOut(suc:@escaping ()->Void,fail:@escaping ()->Void) {
        _ = Amplify.Auth.signOut() { (result) in
            switch result {
            case .success:
                print("Successfully signed out")
                suc()
            case .failure(let error):
                print("Sign out failed with error \(error)")
                fail()
            }
        }
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
                    self.fetchUserProfile(userId: usersub, suc: suc, fail: fail)
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
    public func fetchUserProfile(userId:String,suc:@escaping ()->Void,fail:@escaping (_ msg:String)->Void){
        Amplify.API.query(request: .fetchUserProfile(byId: userId)){
            event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
                    guard let postData = try? JSONEncoder().encode(data) else {
                        fail("fetch User Profile Fail");
                        return
                    }
                    guard  let d = try? JSONSerialization.jsonObject(with: postData, options: .mutableContainers) else {
                        fail("fetch User Profile Fail");
                        return
                    }
                    let dic = d as! NSDictionary
                    guard let subDic = dic["getUserProfile"] as? NSDictionary else {
                        fail("fetch User Profile Fail");
                        return
                    }
                    LoginTools.sharedTools.saveUserInfo(dic: subDic as! [String : Any])
                    suc();
                    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\(LoginTools.sharedTools.userId())");
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                    fail("\(error.errorDescription)");
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                fail("\(error)");
            }
        }
    }
}

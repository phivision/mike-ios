//
//  LoginUIView.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/29.
//

import SwiftUI

struct LoginUIView: View {
    @State var isNavigationBarHidden: Bool = true
    @State var shouldEnterNextPage: Bool = false
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 65, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("Welcome to")
                        .font(Font.custom(nSemiBold, size: 28))
                        .foregroundColor(Color("nearBlack"))
                        .padding(.top,50)
                    Text("Mike")
                        .font(Font.custom(nSemiBold, size: 28))
                        .foregroundColor(Color("darkPurple"))
                    Text("Begin your fitness journey today")
                        .font(Font.custom(nRegular, size: 16))
                        .foregroundColor(Color("lightGrey"))
                        .padding(.top,25)
                    Image("loginCenterImg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: kScreenWidth, height: kScreenWidth*297/421, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    NavigationLink(
                        destination: LoginSecondUIView(),
                        isActive: self.$shouldEnterNextPage,
                        label: {
                            Button.init(action: {
                                self.shouldEnterNextPage = true
                            }, label: {
                                Text("Sign in")
                                    .font(Font.custom(nExtraBoldFont, size: 16))
                                    .foregroundColor(.white)
                                    .frame(width: kScreenWidth - 130, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .background(Color("lightPurple"))
                                    .cornerRadius(20)
                                    .padding(.top,37)
                            })
                        })
                    NavigationLink(
                        destination: HomeTabUIView()){
                        VStack {
                            Text("Don’t have an account?")
                                .font(Font.custom(nRegular, size: 16))
                                .foregroundColor(Color("nearBlack"))
                                .padding(.top,25)
                            Text("Sign up online.")
                                .font(Font.custom(nRegular, size: 16))
                                .foregroundColor(Color("lightPurple"))
                                .padding(.top,5)
                        }
                    }
                })
            }
        }
        .navigationBarHidden(true)
        .onAppear(){
            self.isNavigationBarHidden = true
        }
        .onDisappear(){
            self.isNavigationBarHidden = false
        }
    }
}

struct LoginUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUIView()
    }
}

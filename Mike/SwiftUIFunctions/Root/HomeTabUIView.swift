//
//  HomeTabUIView.swift
//  Mike
//
//  Created by 殷聃 on 2021/6/29.
//

import SwiftUI

struct HomeTabUIView: View {
    @State var index:Int = 0
    var body: some View {
        VStack{
            Spacer()
            CustomTabs(index: self.$index)
        }
    }
}

struct CustomTabs:View {
    @Binding var index:Int
    var body: some View {
        HStack{
            Button(action: {
                self.index = 0
            }){
                Image(index == 0 ? "icon_home_H" : "icon_home_N")
            }
            Spacer(minLength: 0)
            Button(action: {
                self.index = 1
            }){
                Image(index == 1 ? "icon_chat_H" : "icon_chat_N")
            }
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Button(action: {
                self.index = 2
            }){
                Image(index == 2 ? "icon_user_H" : "icon_user_N")
            }
        }
        .padding(.horizontal,35)
        .padding(.vertical,10)
        .background(Color.white)
        .cornerRadius(20, corners: [.topLeft,.topRight])
        .shadow(color: Color("f8Back"), radius: 3, x: 0, y: -5)
    }
}
extension View{
    func cornerRadius(_ radius:CGFloat,corners:UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius:radius,corners:corners))
    }
}
struct RoundedCorner: Shape {
    var radius:CGFloat = .infinity
    var corners:UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct HomeTabUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabUIView()
    }
}

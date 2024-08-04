//
//  ContentView.swift
//  client-ios-auth-test
//
//  Created by k22036kk on 2024/08/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct LoginView: View {
    @State var inputEmail: String = ""
    @State var inputPassword: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Spacer()
                
                Text("Client")
                    .font(.system(size: 48,
                                  weight: .heavy))
                
                Text("ios-auth-test")
                    .font(.system(size: 40,
                                  weight: .heavy))

                VStack(spacing: 24) {
                    TextField("Mail address", text: $inputEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 280)

                    SecureField("Password", text: $inputPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 280)

                }
                .frame(height: 200)

                Button(action: {
                    let url = URL(string: "http://127.0.0.1:5000/signup")!
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"      // Postリクエストを送る(このコードがないとGetリクエストになる)
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    var params = Dictionary<String, String>()
                    params["email"] = inputEmail
                    params["password"] = inputPassword
                    do{
                        request.httpBody = try JSONSerialization.data(withJSONObject: params)
                    }catch{
                        print(error.localizedDescription)
                    }
                    
                    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                        guard let data = data else { return }
                        do {
                            let object = try JSONSerialization.jsonObject(with: data, options: [])
                            print(object)
                        } catch let error {
                            print(error)
                        }
                    }
                    task.resume()
                },
                label: {
                    Text("Login")
                        .fontWeight(.medium)
                        .frame(minWidth: 160)
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.accentColor)
                        .cornerRadius(8)
                })

                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}

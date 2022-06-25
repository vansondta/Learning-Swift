import UIKit

func callApi() {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
        return
    }
    print("abc")
    var request = URLRequest(url: url)
    // method, body, headers
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String: AnyHashable] = [
        "userId": 1,
        "title" : "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body , options: .fragmentsAllowed)
//    request.setValue("application/json", forHTTPHeaderField: "Authorization")

    // make the request
    let task = URLSession.shared.dataTask(with: request) { data, _, err in
        guard let data = data, err == nil else {
            return
        }
        do {
            let response = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            print("Succes: \(response)")
        }
        catch {
            print(err as Any)
        }
    }
    task.resume()
    //
}

callApi()

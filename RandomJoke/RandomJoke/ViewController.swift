//
//  ViewController.swift
//  RandomJoke
//
//  Created by sunny on 2019/6/5.
//  Copyright © 2019 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var jokeList = Array<String>()
    
    struct Joke: Codable {
        var current_page: Int
        var limit: Int
        var next_page: Int
        var previous_page: Int
        var results: [Result]
        var search_term: String
        var status: Int
        var total_jokes: Int
        var total_pages: Int
    }
    
    struct Result: Codable {
        var id: String
        var joke: String
    }
    
    @IBOutlet weak var jokeView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
       // loadJsonInfo()
        // 下載網址
        let address = "https://icanhazdadjoke.com/search"
        // 產生 URL
        if let url = URL(string: address) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            // 產生 URLSession
            let session = URLSession(configuration: .default)
            // 產生 task
            let task = session.dataTask(with: request) { (data, response, error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                do {
                    if let data = data {
                        let test = try decoder.decode(Joke.self, from: data)
                            for jokes in test.results {
                                self.jokeList.append(jokes.joke)

                            }
                        DispatchQueue.main.async {
                            self.jokeView.text = self.jokeList.shuffled()[0]
                        }
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
            // 開始下載
            task.resume()
        }
        
    }

    @IBAction func Reply(_ sender: UIBarButtonItem) {
        self.jokeView.text = self.jokeList.shuffled()[0]
        print(jokeList.count)
    }
    

}

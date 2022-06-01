//
//  Colors.swift
//  ColorsApp
//
//  Created by Osher Yeffet on 01/06/2022.
//
import Foundation
// swiftlint: disable unused_closure_parameter
class Colors: Codable {
    var colors: [ColorsData]

    init(colors: [ColorsData]) {
        self.colors = colors
    }
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }

        return nil
    }

    func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(Colors.self, from: jsonData)
            self.colors = decodedData.colors
//            print("color_name: ", decodedData.)
//            print("color_values: ", decodedData.color_values)
//            print("color_description", decodedData.color_description)
//            print("color_meaning", decodedData.color_meaning)
//            print(decodedData)
            print(colors)
        } catch {
            print("decode error")
        }
    }

    private func loadJson(fromURLString urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                if let data = data {
                    completion(.success(data))
                }
            }
            urlSession.resume()
        }
    }
}

//
//  Colors.swift
//  ColorsApp
//
//  Created by Osher Yeffet on 01/06/2022.
//
import Foundation
// swiftlint:disable unused_closure_parameter
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

//    func readLocalJSONFile(forName name: String) -> Data? {
//        do {
//            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
//                let fileUrl = URL(fileURLWithPath: filePath)
//                let data = try Data(contentsOf: fileUrl)
//                return data
//            }
//        } catch {
//            print("error: \(error)")
//        }
//        return nil
//    }

    func parse(jsonData: Data) -> Colors? {
        do {
            let decodedData = try JSONDecoder().decode(Colors.self, from: jsonData)
            self.colors = decodedData.colors
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }

//    func parse(jsonData: Data) {
//        do {
//            let decodedData = try JSONDecoder().decode(Colors.self, from: jsonData)
//            self.colors = decodedData.colors
//            print(colors[0])
//        } catch {
//            print("decode error")
//        }
//    }

    func loadJson(fromURLString urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
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

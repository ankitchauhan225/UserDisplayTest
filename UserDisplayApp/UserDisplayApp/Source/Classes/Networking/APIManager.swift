//
//  APIManager.swift
//  UserDisplayApp
//
//  Created by Ankit Chauhan on 19/07/23.
//

import Foundation
import Alamofire

class APIManager: SessionDelegate {
    // MARK: - Vars & Lets
    private let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        return Session(configuration: configuration)
      }()
    
    public static var customHeader: [String: String] = [:]

    // MARK: - Vars & Lets
    private static var sharedApiManager = APIManager()
//    private static var sharedApiManager: APIManager = {
//        let apiManager = APIManager(sessionManager: Session(delegate: CustomSessionDelegate(), eventMonitors: []))
//        return apiManager
//    }()

    // MARK: - Accessors
    class func shared() -> APIManager {
        return sharedApiManager
    }
    
    func call<T>(type: EndPointType, params: Parameters? = nil, handler: @escaping (T?, _ error: AlertMessage?) -> Void) where T: Codable {
        self.sessionManager.request(type.url,
                   method: type.httpMethod,
                   parameters: params,
                   encoding: type.encoding,
                   headers: type.headers).validate().responseJSON { data in

                    if let respData = data.data {
                        let response = String(data: respData, encoding: .utf8)
                        #if DEBUG
                        debugPrint("Response : \(response ?? "No response data")")
                        #endif
                    }

                    switch data.result {

                        case .success(_):
                                                               
                            let decoder = JSONDecoder()
                            if let jsonData = data.data {
                                do {
                                    let result = try decoder.decode(T.self, from: jsonData)
                                    handler(result, nil)

                                } catch let error {
                                    print(error)
                                    handler(nil, nil)
                                }
                            }
                        case .failure(_):
                        handler(nil, self.parseApiError(data: data.data))
                    }
                   }.cURLDescription { description in

                    #if DEBUG
                    debugPrint(description)
                    #endif
                   }
    }

    private func parseApiError(data: Data?) -> AlertMessage {
        let decoder = JSONDecoder()
        if let jsonData = data, let error = try? decoder.decode(ErrorObject.self, from: jsonData) {
            let errorAlert = AlertMessage()
            errorAlert.title = error.errorBody ?? ""
            errorAlert.body = error.errorBody ?? ""
            return errorAlert
        }
        return AlertMessage()
    }

//    // Download
//    func downloadFile(type: EndPointType, filename: String, completion: @escaping ((_ filePath: URL?, _ error: Error?) -> Void)) {
//        let fileName = filename
//        let destination: DownloadRequest.Destination = { _, _ in
//            var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//            // Remove existing files, to avoid multiple txn pdf files.
//            do {
//                let fileURLs = try FileManager.default.contentsOfDirectory(at: documentsURL,
//                                                                           includingPropertiesForKeys: nil,
//                                                                           options: .skipsHiddenFiles)
//                for fileURL in fileURLs where fileURL.pathExtension == "pdf" {
//                    try FileManager.default.removeItem(at: fileURL)
//                }
//            } catch {
//                #if DEBUG
//                debugPrint(error)
//                #endif
//            }
//
//            documentsURL.appendPathComponent(fileName)
//            return (documentsURL, [.removePreviousFile])
//        }
//
//        AF.download(type.url, headers: type.headers, to: destination).response { response in
//            completion(response.fileURL, response.error)
//        }
//    }
//
//    func downloadConfigJsonFile(urlPath: String, completion: @escaping (Data?, String?) -> Void) {
//
//        guard let urlTarget = URL(string: urlPath) else {
//                    completion(nil, nil)
//                    return
//        }
//
//        AF.request(urlTarget, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { response in
//            switch response.result {
//                    case .success:
//                        if let json = response.data {
//                            completion(json, nil)
//                        } else {
//                            completion(nil, "Json Invalid")
//                        }
//                    case .failure(let error):
//                        print(error)
//                        completion(nil, error.localizedDescription)
//            }
//        })
//    }
}

struct DelegatePostData: Codable {
    public var content: [String: String]?
    public init( content: [String: String]?) {
        self.content = content
    }
}

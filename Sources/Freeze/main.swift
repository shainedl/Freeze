import Foundation
import Alamofire

if let accountSID = ProcessInfo.processInfo.environment["TWILIO_ACCOUNT_SID"],
    let authToken = ProcessInfo.processInfo.environment["TWILIO_AUTH_TOKEN"] {
    
    let url = "https://api.twilio.com/2010-04-01/Accounts/\(accountSID)/Messages"
    let parameters = ["From": "+17027100845", "To": "+17028620117", "Body": "Freeze has detected that Shaine Leibowitz may be in danger. You may call her here, and see her location here https://maps.google.com/maps?rlz=1CDGOYI_enUS722US722&hl=en-US&um=1&ie=UTF-8&fb=1&gl=us&entry=s&sa=X&ftid=0x89c259ba857dd7a7:0xa9377b1a9772ce08&gmm=CgIgAQ%3D%3D"]
    
    Alamofire.request(url, method: .post, parameters: parameters)
        .authenticate(user: accountSID, password: authToken)
        .responseJSON { response in
            debugPrint(response)
    }
    
    RunLoop.main.run()
}

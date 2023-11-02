//
//  WebViewController.swift
//  Lol Page
//
//  Created by Tony Lieu on 11/1/23.
//

import UIKit
import WebKit
class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var urlBan = URL(string: "www.youtube.com")
    var host:String = "https://imgflip.com/memegenerator"
    override func viewDidLoad() {
        super.viewDidLoad()
      
        loadWebIn(address: "https://imgflip.com/memegenerator")
        // Do any additional setup after loading the view.
    }
    
    func loadWebIn(address:String){
        guard let url = URL(string: address) else{return}
        let request = URLRequest(url:url)
        webView.load(request)
       /* func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let host = navigationAction.request.url?.host {
                if host.contains(address) {
                    decisionHandler(.allow)
                    webView.load(request)
                }
            }

            decisionHandler(.cancel)
        }*/
        
    }

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
/*func checkWebSite(website: String)-> URLRequest{
    var urlBan = "www.youtube.com"
    if website != urlBan{
        let url2 = URL(string: "https://imgflip.com/memegenerator") ?? <#default value#>
        return URLRequest(url: url2)
    }else{
        var urlNothing:URLRequest
        print("Site not allowed")
        return urlNothing
    }
}
*/


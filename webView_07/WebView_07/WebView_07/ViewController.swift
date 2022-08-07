//
//  ViewController.swift
//  WebView_07
//
//  Created by 윤승현 on 2022/08/07.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    //WKNavigationDelegate를 상속사켜줘서 WebView의 기능을 사용할 수 았게 됨

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    //textField와 WebView,Indicator의 아울렛 변수를 선언
    
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    //WebView를 불로오는 함수 인수로 주어진 Url에 request를 보내서 Webview에 불러온다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage("http://2sam.net")
    }
    //앱이 실행될 때 불러올 웹의 Url로 webView를 설정한다.
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    //웹뷰를 불러오는 동안 Indicator가 실행
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = true

    }
    //웹뷰가 로딩이 끝나고 Indicator가 중지

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = true
    }
    //웹뷰가 에러가 발새하고 Indicator가 중지

    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    //textFile에 http://가 앞에 붙어있지 않으면 자동으로 붙여준다.

    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    //Go 버튼을 누르면 해당 url로 WebView를 불러온다.
    
    @IBAction func btnGotoSite1(_ sender: UIButton) {
        loadWebPage("http://fallinmac.tistory.com")
    }
    //site1 버튼 누를 시 이동할 사이트 설정
    
    @IBAction func btnGotoSite2(_ sender: UIButton) {
        loadWebPage("http://blog.2sam.net")
    }
    //site2 버튼 누를 시 이동할 사이트 설정
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let html = "<h1> HTML String</h1><p> String 변수를 이용한 웹 페이지</p><p><a href=\"http://2sam.net\">2sam</a></p>"
        
        myWebView.loadHTMLString(html, baseURL: nil)
    }
    //문자열에 저장된 html으로 webView를 로드한다.
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest =  URLRequest(url: myUrl)
        
        myWebView.load(myRequest)
    }
    //file에 저장된 html을 불러와 화면에 로드한다.
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}


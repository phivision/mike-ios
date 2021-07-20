//
//  ChargeViewController.swift
//  Mike
//
//  Created by 殷聃 on 2021/7/20.
//

import UIKit
import StoreKit
import Amplify
class ChargeViewController: BaseViewController {
    @IBOutlet weak var mainTableView:UITableView!
    @IBOutlet weak var tokenBalanceLab:UILabel!
    lazy var chargeListData:[SKProduct] = {
        var chargeListData:[SKProduct] = [];
        return chargeListData;
    }()
    var tokenBalance:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Coins"
        self.setNavLeftBtn(imageName: "icon-back")
        self.configTableView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = false
        self.fetchInAppPList()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.isNavigationBarHidden = true
    }
    func configTableView(){
        self.tokenBalanceLab.text = "\(self.tokenBalance ?? "")"
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.register(UINib(nibName: "ChargeListCell", bundle: nil), forCellReuseIdentifier: "ChargeListCell")
        self.mainTableView.separatorStyle = .none
        self.mainTableView.tableFooterView = UIView()
    }
    
    func fetchInAppPList(){
//        SVProgressHUD.setDefaultMaskType(.black)
//        SVProgressHUD.show(withStatus: "加载中");
        var letters = Set<String>()
        letters.insert("Coins0010")
        letters.insert("Coin0001")
        let request:SKProductsRequest = SKProductsRequest(productIdentifiers:letters)
        request.delegate = self
        request.start()
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

extension ChargeViewController:SKProductsRequestDelegate,SKPaymentTransactionObserver{
    //当请求完毕之后,从苹果服务器获取到数据之后调用
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        //response
        //products 可以被销售的商品
        //invalidProductIdentifiers 无效的商品ID
        print("可以被销售的商品:\(response.products)")
        self.chargeListData.removeAll()
        self.chargeListData.append(contentsOf: response.products)
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
            print("无效的商品ID :\(response.invalidProductIdentifiers)")
            //2.0判断当前的支付环境,是否可以支付
//            SVProgressHUD.dismiss()
        }
    }
    //当交易队列列名添加的每一笔交易状态发生变化的时候调用
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            print("购买状态＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝\(transaction.transactionState)")
            // 如果小票状态是购买完成
            switch transaction.transactionState {
            case .purchased:
                // 更新界面或者数据，把用户购买得商品交给用户
                print("支付成了＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝\(Thread.current)")
                DispatchQueue.main.async {
//                    SVProgressHUD.dismiss()
                }
                // 验证购买凭据
                self.verifyPruchase()

                // 将交易从交易队列中删除
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            case .failed:
                print("支付失败＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝\(Thread.current)")
                DispatchQueue.main.async {
//                    SVProgressHUD.dismiss()
                }
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            case .purchasing:
                break
            case .restored:
                // 更新界面或者数据，把用户购买得商品交给用户
                // ...
                // 将交易从交易队列中删除
                DispatchQueue.main.async {
//                    SVProgressHUD.dismiss()
                }
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            case .deferred:
                break
            default:
                SKPaymentQueue.default().finishTransaction(transaction)
                break
            }

        }
    }
    func verifyPruchase(){
        // 验证凭据，获取到苹果返回的交易凭据
        // appStoreReceiptURL iOS7.0增加的，购买交易完成后，会将凭据存放在该地址
        if let receiptURL = Bundle.main.appStoreReceiptURL{
            // 从沙盒中获取到购买凭据
            let receiptData = NSData(contentsOf: receiptURL)
            // 在网络中传输数据，大多情况下是传输的字符串而不是二进制数据
            // 传输的是BASE64编码的字符串
            /**
            BASE64 常用的编码方案，通常用于数据传输，以及加密算法的基础算法，传输过程中能够保证数据传输的稳定性
            BASE64是可以编码和解码的
            */
            let encodeStr = receiptData?.base64EncodedString(options: NSData.Base64EncodingOptions.endLineWithLineFeed)
//            print(encodeStr)
            let hud:MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
            let request = RESTRequest(apiName: "appStore",path: "/appstore/verify",queryParameters: ["userID":LoginTools.sharedTools.userId(),"receipt":encodeStr ?? ""])
            Amplify.API.post(request: request) { result in
                switch result {
                case .success(let data):
                    let str = String(decoding: data, as: UTF8.self)
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue:refreshTrainerContentList), object: nil)
                    DispatchQueue.main.async {
                        hud.hide(animated: true)
                        self.dismiss(animated: true, completion: nil)
                    }
                    print("Success \(str)")
                case .failure(let apiError):
                    print("Failed", apiError)
                    DispatchQueue.main.async {
                        hud.hide(animated: true)
                        ToastHUD.showMsg(msg: apiError.localizedDescription, controller: self)
                    }
                }
            }
//            self.myCenterViewModel.fetchPayResult(receipt: encodeStr ?? "") { (suc) in
//                if(suc == true){
//                    self.navigationController?.popViewController(animated: true)
//                }else{
//                    let alert:UIAlertController = UIAlertController(title: "支付结果", message: "支付失败", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "取消", style: .default, handler: nil))
//                    DispatchQueue.main.async {
//                        self.present(alert, animated: true, completion: nil)
//                    }
//                }
//            }
        }else{
//            Toast(self.view, "没有拿到receiptURL");
        }
    }
}
extension ChargeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chargeListData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ChargeListCell = tableView.dequeueReusableCell(withIdentifier: "ChargeListCell", for: indexPath) as! ChargeListCell
        cell.setProduct(product: self.chargeListData[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //2.购买商品
        //2.1 根据商品,开一个支付小票
        let payment = SKPayment(product: self.chargeListData[indexPath.row])
        //2.2添加到支付队列,开始进行购买队列
        SKPaymentQueue.default().add(payment)
        //2.3添加交易队列坚挺着,来监听交易状态
        SKPaymentQueue.default().add(self)
    }
    func chargeBtnPressed(){
        if SKPaymentQueue.canMakePayments() {
//            SVProgressHUD.setDefaultMaskType(.black)
//            SVProgressHUD.show(withStatus: "支付中")
//

        }
    }
}


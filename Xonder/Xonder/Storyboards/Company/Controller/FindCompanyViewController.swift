//
//  FindCompanyViewController.swift
//  Xonder
//
//  Created by Muhammad Umar on 27/07/2021.
//

import UIKit

class FindCompanyViewController: UIViewController {
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    private var textFieldValue = "" {
        didSet {
            debouncer.call()
        }
    }
    private var debouncer: Debouncer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debouncer = Debouncer.init(delay: 3, callback: debouncerApiCall)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAct(_ sender: Any) {
    }
    @IBAction func doneAct(_ sender: Any) {
    }
    
    @IBAction func textChanged(_ sender: Any) {
        textFieldValue = (sender as? UITextField)?.text ?? ""
    }
    
    
    private func debouncerApiCall() {
        print("debouncer api call")
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

extension FindCompanyViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyDetailTableViewCell", for: indexPath) as? CompanyDetailTableViewCell{
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension FindCompanyViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
        return true
    }
}

public class Debouncer: NSObject {
    public var callback: (() -> Void)
    public var delay: Double
    public weak var timer: Timer?
 
    public init(delay: Double, callback: @escaping (() -> Void)) {
        self.delay = delay
        self.callback = callback
    }
 
    public func call() {
        timer?.invalidate()
        let nextTimer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(Debouncer.fireNow), userInfo: nil, repeats: false)
        timer = nextTimer
    }
 
    @objc func fireNow() {
        self.callback()
    }
}

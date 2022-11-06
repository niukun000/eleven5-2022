//
//  TableNavigationDetailViewController.swift
//  Nov04p1
//
//  Created by Kun Niu on 11/4/22.
//

import UIKit

protocol DismissDelegate: AnyObject {
    func dismissViewController(text: String?)
}

class TableNavigationDetailViewController: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    
    var delegate: DismissDelegate?
    
    var picString : String?
    var nameString : String?
    var typeString : String?
    var detailString : String?
    @IBOutlet weak var detail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picture.image = UIImage(named: nameString ?? "BlueEyes")
        print(self.nameString ?? "None")
        self.name.text = self.nameString
        self.type.text = self.nameString
        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func back(_ sender: Any) {
        self.delegate?.dismissViewController(text: "Example Text")

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

//
//  DemoTableViewController.swift
//  TableCollectionViewDemo10.25.22
//
//  Created by iAskedYou2nd on 11/1/22.
//

import UIKit

class DemoTableViewController: UIViewController {

    @IBOutlet weak var demoTableView: UITableView!
    @IBOutlet weak var swapButton: UIButton!
    
    
    var data: [String] = ["Ralph", "Buddy", "Violet", "Kevin", "Goleat", "Carlos"]
    var name: [String] = ["ASHE","CAITLYN","EZREAL","GAREN","HECARIM","JAX","JINX","KAISA","KAYLEMKOGMAW","LEBLANC","LUCIAN","MASTERYI","MORDEKAISER","NAMI","NASUS","NOCTURNE","NUNU","OLAF","RAMMUS","RUMBLE","SHACO","TEEMO","TRISTANA","TRUNDLE","TRYNDAMERE","TWITH","VAYNE","VEIGAR","VI","XAYAH"]
    var index : Int?
//    override var description: String = ["s"]
    // true -> XIB, false -> Storyboard
    var cellAppearanceState: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.title = "Table View"
    }
    
    func setupUI() {
        self.swapButton.setTitle("Swap to Storyboard", for: .normal)
        self.demoTableView.dataSource = self
        self.demoTableView.delegate = self
        self.demoTableView.register(UINib(nibName: "XIBTableTableViewCell", bundle: nil)
                                    , forCellReuseIdentifier: "XIBTableCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detail = segue.destination as?  TableNavigationDetailViewController
        detail?.nameString = name[index ?? 0]
        detail?.delegate = self
    }
    
    @IBAction func swapButtonPressed(_ sender: Any) {
        self.cellAppearanceState.toggle()
        let title = (self.cellAppearanceState) ? "Swap to Storyboard" : "Swap to XIB"
        self.swapButton.setTitle(title, for: .normal)
        self.demoTableView.reloadData()
    }
    

}


extension DemoTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        if self.cellAppearanceState {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "XIBTableCell", for: indexPath) as? XIBTableTableViewCell else {
                fatalError("You did not use the correct cell identifier")
            }
            
            cell.configure(imageName: "BlueEyes", dogName: name[indexPath[1]])
            
            
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableCell", for: indexPath) as? DemoStoryBoardTableViewCell else {
                fatalError("You did not use the correct cell identifier")
            }
            print(indexPath)
                        
            cell.configure(imageName: "BlueEyes", dogName: name[indexPath[1]])

            return cell
            
        }
    }
}
extension DemoTableViewController: DismissDelegate{
    func dismissViewController(text: String?) {
//        print(text)
//        self.stringArr.append(text ?? "Missing Data")
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
}
extension DemoTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        print(indexPath)
        self.index = indexPath[1]
        self.performSegue(withIdentifier: "detailPage", sender: nil)
        return indexPath
    }
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        print("Selected Row at: \(indexPath)")
    //
    ////        print(index ??  0)
    //
    //        self.performSegue(withIdentifier: "detailPage", sender: nil)
    //}
}
    



//
//  ViewController.swift
//  SampleSwiftProject
//
//  Created by Siva Sankar on 27/10/16.
//  Copyright © 2016 Siva Sankar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var arrayVaues : NSMutableArray = ["Manoj", "Siva", "Sankar"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.testingMethod()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testingMethod()  {
        print("Testing method");
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayVaues.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cellIdentifier = "call-Identifier"
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)! as UITableViewCell
        
        cell.textLabel?.text = arrayVaues[indexPath.row] as? String
        
        return cell
    }
    
    
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailView", sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailView" {
            
            let destView = segue.destination as! DetailViewController
            let indexPath = sender as! NSIndexPath
            
            destView.nameString = arrayVaues[indexPath.row] as! NSString

        }
//        destView.nameLbl.text = arrayVaues[indexPath.row] as? String
        
    }


}


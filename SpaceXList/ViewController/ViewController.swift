//
//  ViewController.swift
//  SpaceXList
//
//  Created by Derefaa Cline on 12/28/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ViewModelProtocol{
    
    
    
    @IBOutlet weak var Spacetbl:UITableView!
    var svm = SpaceXViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Spacetbl.delegate = self
        Spacetbl.dataSource = self
        
        svm.delegate = self
        svm.collectdatafromApi()
        
        Spacetbl.register(UINib(nibName: "SpaceXTableViewCell", bundle: nil), forCellReuseIdentifier: "SpaceXTableViewCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Spacetbl.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        svm.getNumofRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpaceXTableViewCell")as! SpaceXTableViewCell
        cell.spaceXdata = svm.getLaunchIndex(for: indexPath.row)
        return cell
    }
    
    
    func didGetLaunchData() {
        DispatchQueue.main.async{
            self.Spacetbl.reloadData()
        }
    }



}


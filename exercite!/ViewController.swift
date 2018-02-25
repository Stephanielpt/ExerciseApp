//
//  ViewController.swift
//  exercite!
//
//  Created by Stephanie Lampotang on 2/25/18.
//  Copyright © 2018 Stephanie Lampotang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var exs = [""]
    
    @IBOutlet weak var exercise: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var duration: UITextField!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "steph",for: indexPath) //as? UITableViewCell
        //exs.append("\(duration.text!) \(exercise.text!)")
        var i = 1
        while i <= 10 {
            cell.textLabel?.text = exs[i]
            i = i+1
        }
//        cell.textLabel?.text = exs[0]
        return cell
    }
    
    @IBAction func addExercise(_ sender: UIButton) {
        
        //var both = "\(duration.text!)" + " " + "\(exercise.text!)"
        //if both.count > 0 {exs = exs.append(both)}
        let cell = tableView.dequeueReusableCell(withIdentifier: "steph") as? UITableViewCell
        cell?.textLabel?.text = "\(duration.text!) \(exercise.text!)"
        tableView.alpha = 1
        exs.append("\(duration.text!) \(exercise.text!)")
        self.tableView.reloadData()
        print("\(duration.text!) \(exercise.text!)")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "steph")
        // Do any additional setup after loading the view, typically from a nib.
        let bluminesence = UIColor(displayP3Red: 224/255, green: 255/255, blue: 255/255, alpha: 1)
        view.backgroundColor = bluminesence
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is TimeController
        {
            if let vc = segue.destination as? TimeController
            {vc.exercisetype.text = "\(String(describing: duration.text)) \(String(describing: exercise.text))"}
        }
    }

}


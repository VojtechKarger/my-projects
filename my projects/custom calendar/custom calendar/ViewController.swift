//
//  ViewController.swift
//  custom calendar
//
//  Created by vojta on 02.02.2021.
//

import UIKit

class ViewController: UITableViewController, UNUserNotificationCenterDelegate {
    var seznamDatumu = [String]()
    var text = [String]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        seznamDatumu = defaults.array(forKey: "datum") as? [String] ?? [String]()
        text = defaults.array(forKey: "text") as? [String] ?? [String]()
        title = "Remainders"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(removeAll))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(vytvorzaznam))
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTable), name: .addingNotification, object: nil)
        
    }
    @objc func removeAll() {
        text.removeAll()
        seznamDatumu.removeAll()
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        center.removeAllDeliveredNotifications()
        tableView.reloadData()
    }
  
    
    @objc func reloadTable (notification: Notification) {
        let dateVC = notification.object as! addViewController
        seznamDatumu.append(dateVC.datum)
        text.append(dateVC.textField.text ?? "")
        tableView.reloadData()
        
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = dateVC.textField.text!
        content.categoryIdentifier = "reminder"
        content.sound = UNNotificationSound.default
        content.summaryArgument = "\(text.count)"
        
        let date = dateVC.datePicker.date
        let comps = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)

        let trigger = UNCalendarNotificationTrigger(dateMatching: comps, repeats: false)

        let request = UNNotificationRequest(identifier: "\(seznamDatumu.count)", content: content, trigger: trigger)
            center.add(request)
        defaults.set(seznamDatumu, forKey: "datum")
        defaults.set(text, forKey: "text")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seznamDatumu.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = text[indexPath.row]
        cell.detailTextLabel?.text = seznamDatumu[indexPath.row]
        return cell
    }
    @objc func reload () {
        
        print(seznamDatumu)
        if let date = defaults.string(forKey: "date") {
            seznamDatumu.append(date)
            tableView.reloadData()
        }
      
        
        
    }
    
    



@objc func vytvorzaznam () {
    let vc = addViewController()
    vc.modalPresentationStyle = .overCurrentContext
   
    
    present(vc, animated: true)
    
    
    
}
    
}

//
//  ViewController.swift
//  UsersApp
//
//  Created by Yavuz Güner on 24.07.2022.
//

import UIKit

class MainPageVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var userList = [Users]()
    
    var mainPagePresenterObject : ViewToPresenterMainPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        MainPageRouter.createModule(ref: self)

        
    }

    override func viewWillAppear(_ animated: Bool) {
        mainPagePresenterObject?.loadAllUsers()
    }

}

extension MainPageVC : PresenterToViewMainPageProtocol {
    func sendDataToView(usersList: Array<Users>) {
        self.userList = usersList
        self.tableView.reloadData()
    }
}

extension MainPageVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        mainPagePresenterObject?.search(searchWord: searchText)
    }
}

extension MainPageVC : UITableViewDelegate,UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = userList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! TableViewCell
        cell.userInfoLabel.text = "\(user.user_name!) - \(user.user_phone!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = userList[indexPath.row]
        performSegue(withIdentifier: "toUserDetailVC", sender: user)
        tableView.deselectRow(at: indexPath, animated: true) //Geri döndüğümüzde üzerinde seçili kalan koyu rengi atarız.
    }
    //Sayfalar arası geçişte verileri dinlemek için kullanıyoruz.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUserDetailVC" {
            let user = sender as? Users
            let toVC = segue.destination as! UserDetailVC
            toVC.user = user
        }
    }
    
    //Swipe işlemi
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let user = userList[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (contextualAction,view,bool) in
            let alert = UIAlertController(title: "Delete Action", message: "Do you want to delete \(user.user_name!) ?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ action in
                
            }
            let yesAction = UIAlertAction(title: "Yes", style: .destructive) {action in
                self.mainPagePresenterObject?.delete(user_id: user.user_id!)
            }
            alert.addAction(cancelAction)
            alert.addAction(yesAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])

    }
    
}

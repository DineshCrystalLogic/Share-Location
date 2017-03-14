//
//  LeftViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 12/3/14.
//

import UIKit

enum LeftMenu: Int {
    case main = 0
    case peopleICanSee
    case requestAccept
    case profile
    case setting
}

protocol LeftMenuProtocol : class
{
    func changeViewController(_ menu: LeftMenu)
}

class LeftViewController : UIViewController, LeftMenuProtocol
{
    
    @IBOutlet weak var tableView: UITableView!
    var menus = ["Home","People I can see", "Request Access","Profile", "Settings"]
    
    var mainViewController: UIViewController!
    var peopleIcanseeVC:UIViewController!;
    var requestAcceptVC:UIViewController!;
    var profileVC:UIViewController!;
    var settingVC: UIViewController!
    
    
    
    var imageHeaderView: ImageHeaderView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tableView.separatorColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.mainViewController = UINavigationController(rootViewController: mainViewController)
        
        
        let peopleIcanseeVC = storyboard.instantiateViewController(withIdentifier: "PeopleICanSeeVC") as! PeopleICanSeeVC
        self.peopleIcanseeVC = UINavigationController(rootViewController:peopleIcanseeVC)
        
        let requestAcceptVC = storyboard.instantiateViewController(withIdentifier: "RequestAcceptVC") as! RequestAcceptVC
        self.requestAcceptVC = UINavigationController(rootViewController:requestAcceptVC)
        
        let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.profileVC = UINavigationController(rootViewController: profileVC)
        
        let settingVC = storyboard.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        self.settingVC = UINavigationController(rootViewController: settingVC)
        
        
        self.tableView.registerCellClass(BaseTableViewCell.self)
        
        self.imageHeaderView = ImageHeaderView.loadNib()
        self.view.addSubview(self.imageHeaderView)
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        self.imageHeaderView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 160)
        self.view.layoutIfNeeded()
    }
    
    func changeViewController(_ menu: LeftMenu)
    {
        switch menu
        {
        case .main:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .peopleICanSee:
            self.slideMenuController()?.changeMainViewController(self.peopleIcanseeVC, close: true)
        case .requestAccept:
            self.slideMenuController()?.changeMainViewController(self.requestAcceptVC, close: true)
        case .profile:
            self.slideMenuController()?.changeMainViewController(self.profileVC, close: true)
        case .setting:
            self.slideMenuController()?.changeMainViewController(self.settingVC, close: true)
        }
    }
}

extension LeftViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if let menu = LeftMenu(rawValue: indexPath.row)
        {
            switch menu
            {
                case .main, .peopleICanSee, .requestAccept, .profile, .setting:
                return BaseTableViewCell.height()
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let menu = LeftMenu(rawValue: indexPath.row)
        {
            self.changeViewController(menu)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if self.tableView == scrollView
        {
            
        }
    }
}

extension LeftViewController : UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menus.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        if let menu = LeftMenu(rawValue: indexPath.row)
        {
            switch menu
            {
                case .main, .peopleICanSee, .requestAccept, .profile, .setting:
                let cell = BaseTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: BaseTableViewCell.identifier)
                cell.setData(menus[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
}

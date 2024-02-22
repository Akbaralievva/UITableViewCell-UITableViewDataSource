//
//  ViewController.swift
//  Home_4month_3
//
//  Created by A LINA on 18/2/24.


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView = UITableView()
    private var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настройка заголовка
        navigationItem.title = "My Contacts"
        
        // Добавление таблицы на экран
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Настройка таблицы
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        // Загрузка данных
        setData()
    }
    
    private func setData(){
        // Загрузка контактов
        contacts = [
            Contact(name: "Jane Cooper", phoneNumber: "(270) 555-0117", image: "1"),
            Contact(name: "Devon Lane", phoneNumber: "(308) 555-0121", image: "2"),
            Contact(name: "Darrell Steward", phoneNumber: "(684) 555-0102", image: "3"),
            Contact(name: "Devon Lane", phoneNumber: "(704) 555-0127", image: "4"),
            Contact(name: "Courtney Henry", phoneNumber: "(505) 555-0125", image: "5"),
            Contact(name: "Wade Warren", phoneNumber: "(225) 555-0118", image: "6"),
            Contact(name: "Bessie Cooper", phoneNumber: "(406) 555-0120", image: "7"),
            Contact(name: "Robert Fox", phoneNumber: "(480) 555-0103", image: "8"),
            Contact(name: "Jacob Jones", phoneNumber: "(702) 555-0122", image: "9"),
            Contact(name: "Jenny Wilson", phoneNumber: "(239) 555-0108", image: "10")
        ]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "")
        
        let contact = contacts[indexPath.row]
        
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.phoneNumber
        cell.imageView?.image = UIImage(named: contact.image)?.circularImage(size: CGSize(width: 50, height: 50))
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18)
        cell.detailTextLabel?.textColor = .systemGray
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row != tableView.numberOfRows(inSection: 0) - 1 {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 18, right: 0)
        }
    }
}

extension UIImage {
    func circularImage(size: CGSize) -> UIImage {
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: size))
        imageView.contentMode = .scaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = size.width / 2
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, UIScreen.main.scale)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return self }
        imageView.layer.render(in: context)
        guard let roundedImage = UIGraphicsGetImageFromCurrentImageContext() else { return self }
        return roundedImage
    }
}

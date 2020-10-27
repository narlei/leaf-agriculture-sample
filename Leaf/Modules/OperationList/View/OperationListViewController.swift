//
//  OperationListViewController.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Foundation
import UIKit

class OperationListViewController: BaseViewController {
    // MARK: Properties

    @IBOutlet var tableViewList: UITableView!
    var presenter: OperationListPresentation?
    var arrayOperations: [Operation]? {
        didSet {
            tableViewList.reloadData()
        }
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Operation List"
        tableViewList.delegate = self
        tableViewList.dataSource = self
        tableViewList.tableFooterView = UIView()
        presenter?.loadOperations()
    }
}

extension OperationListViewController: OperationListView {
    func load(operations: [Operation]?) {
        arrayOperations = operations
    }
}

extension OperationListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let arrayOperations = arrayOperations else { return }
        presenter?.open(operation: arrayOperations[indexPath.row])
    }
}

extension OperationListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOperations?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellOperation", for: indexPath)
        guard let arrayOperations = arrayOperations else { return cell }
        cell.textLabel?.text = arrayOperations[indexPath.row].operationType
        return cell
    }
}

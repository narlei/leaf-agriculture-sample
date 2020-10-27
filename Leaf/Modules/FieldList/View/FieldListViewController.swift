//
//  FieldListViewController.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Foundation
import UIKit

class FieldListViewController: BaseViewController {
    // MARK: Properties

    var presenter: FieldListPresentation?
    var arrayFields: [Field]? {
        didSet {
            tableViewFields.reloadData()
        }
    }

    @IBOutlet var tableViewFields: UITableView!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Field List"
        tableViewFields.delegate = self
        tableViewFields.dataSource = self
        tableViewFields.tableFooterView = UIView()
        presenter?.loadFields()
    }
}

extension FieldListViewController: FieldListView {
    func load(fields: [Field]?) {
        arrayFields = fields
    }
}

extension FieldListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let arrayFields = arrayFields else { return }
        presenter?.openField(field: arrayFields[indexPath.row])
    }
}

extension FieldListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFields?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellField", for: indexPath)
        guard let arrayFields = arrayFields else { return cell }
        cell.textLabel?.text = arrayFields[indexPath.row].type
        return cell
    }
}

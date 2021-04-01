//
//  TBController.swift
//  Soulwise
//
//  Created by apple on 30/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class TBController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var tableWidth: NSLayoutConstraint!
    
    var sections:[TBSection] = [] {
        didSet {
            if let tbView = tableView {
                tbView.backgroundColor = .clear
                tbView.reloadData()
            }
        }
    }
    
    func cellTypes() -> [TBCellTypes] {
        return [
            TBCellTypes.tbcell
        ]
    }
    
    internal func setUp() {
        if let tbView = tableView {
            tbView.register(cellTypes())
            tbView.delegate = self
            tableView.dataSource = self
            tbView.estimatedRowHeight = 400
    
            
        }
        tableDidLoad()
    }
    
    internal func align() {
        if let tbWidth = tableWidth {
            tbWidth.constant = UIScreen.listAllowedWidth()
        }
    }
    
    func tableDidLoad() {}
    func onSelect(row info:TBRow, indexPath:IndexPath) {}
    func onValueChange(value:Any?, row:TBRow) {}
    func onAction(action: CellAction, rowInfo: TBRow) { }
    func onStateChanged(rowInfo: TBRow) { }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        align()
        tableView?.layoutIfNeeded()
    }    
}

extension TBController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        return section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tbSection = sections[indexPath.section]
        let tbRow = tbSection.rows[indexPath.row]
        let cellType = tbRow.cellType!
        let cell = tableView.dequeueReusableCell(withIdentifier:cellType.rawValue , for: indexPath) as! TBCell
        if let data = tbRow.rowData {
            cell.bindData(data: data)
        }
        
        cell.changeHandler = { [weak self]
            (value) in
            self?.onValueChange(value: value, row:tbRow)
        }
        
        cell.actionHandler = { [weak self]
            (action) in
            self?.onAction(action: action, rowInfo: tbRow)
        }
        
        cell.stateHandler = { [weak self]
            in
            self?.onStateChanged(rowInfo: tbRow)
        }
        return cell
    }
    
}

extension TBController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        let row = section.rows[indexPath.row]
        onSelect(row: row, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension TBController {
    @objc func isEmptyTable() -> Bool {
        return sections.count == 0
    }
    
    @objc func emptyTableMessage() -> String? {
        return nil
    }
    
    @objc func showTryAgain() -> Bool {
        return false
    }
}

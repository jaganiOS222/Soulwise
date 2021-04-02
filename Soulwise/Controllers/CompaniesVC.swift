//
//  ViewController.swift
//  Soulwise
//
//  Created by apple on 30/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class CompaniesVC: TBController {
    let companiesService = CompaniesService.init()
    
    var companiesViewModel:CompaniesViewModel? {
        didSet {
            if let model = companiesViewModel {
                sections = model.display()
            }
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func cellTypes() -> [TBCellTypes] {
        return [.tbcell,
            .companiesTbCell]
    }
    
    func loadData() {
        companiesService.execute { [weak self] (result) in
            if result.isSuccess {
                if let value = result.value as? [CompaniesModel] {
                    self?.companiesViewModel = CompaniesViewModel.init(value)
                }
            }
        }
    }
    override func onSelect(row info: TBRow, indexPath: IndexPath) {
        if let model = info.rowData?.model as? CompaniesItemViewModel {
            DispatchQueue.main.async { [weak self] in
                self?.presentAlert(model.title)
            }
        }
    }
    override func onAction(action: CellAction, rowInfo: TBRow) {
        switch action {
        case .favBtnAction:
            if let model = rowInfo.rowData?.model as? CompaniesItemViewModel {
                DispatchQueue.main.async { [weak self] in
                    self?.presentAlert("do u want like \(model.title)")
                }
            }
        }
    }
}


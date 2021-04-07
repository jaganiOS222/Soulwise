//
//  TBCellTypes.swift
//  Soulwise
//
//  Created by apple on 30/03/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

enum TBCellTypes: String {
    case tbcell = "TBCell"
    case gridTbCell = "GridTBCell"
    case topItemListCell = "TopItemListCell"
    case companiesTbCell = "CompaniesTBCell"
    case meditationCell   = "MeditationCell"
    case feedsHeaderCell  = "FeedsHeaderCell"
    case transriptHeaderCell = "TransriptHeaderCell"
    case transcriptCell = "TranscriptCell"
}

enum CellAction {
    case favBtnAction
    case launchVideo
    case closeAction
}

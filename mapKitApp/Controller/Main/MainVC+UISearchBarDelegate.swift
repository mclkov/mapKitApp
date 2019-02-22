//
//  MainVC+UISearchBarDelegate.swift
//  mapKitApp
//
//  Created by McL on 2/22/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension MainVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // to limit network activity, reload half a second after last key press.
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.startSearch), object: nil)
        self.perform(#selector(self.startSearch), with: nil, afterDelay: MainConstants.startSearchAfterPressedKeyDelay)
    }
}

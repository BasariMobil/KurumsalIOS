//
//  BaseTableVC.swift
//  TheMovies
//
//  Created by Yiğitcan Luş on 8.04.2021.
//

import UIKit

import MarkerKit
import RxSwift

class BaseTableVC: UITableViewController {

    let activityIndicatorView = UIActivityIndicatorView(style: .medium)

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupTableView()
        setupViewAndConstraints()
        setupActivityIndicator()
        bind()
    }

    func setupTableView() {
        tableView.separatorStyle     = .singleLine
        tableView.estimatedRowHeight = 44.0
        tableView.tableFooterView    = UIView()
    }

    func setupViewAndConstraints() {
        
    }

    private func setupActivityIndicator() {
        view.addSubview(activityIndicatorView)

        activityIndicatorView.mrk.centerX(to: view)
        activityIndicatorView.mrk.centerY(to: view, relation: .equal, constant: -100)
    }

    func bind() {

    }

    final func showError(message: String) {
        showAlertController(self, title: "Error", message: message, style: .one("Ok"), handler: nil)
    }

    final func isCanLoadNextData(for scrollView: UIScrollView) -> Bool {
        let currentOffset = scrollView.contentOffset.y

        if scrollView.contentSize.height < scrollView.frame.size.height {
            return false
        }

        let maiximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let deltaOffset = maiximumOffset - currentOffset

        if deltaOffset <= 350 {
            return true
        }

        return false
    }
}

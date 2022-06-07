//
//  ReceivedOfferViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/04/29.
//

import UIKit


struct CompanyData {
    enum OfferState{
        case permit, deny, none
    }
    
    var companyIcon: UIImage? = UIImage(systemName: "house")
    var companyName: String?
    var offerDate: String?
    var offerState: OfferState
    
}

final class OfferViewController: UIViewController {
    @IBOutlet private weak var offerListTableView: UITableView!
    @IBOutlet private weak var navigationView: NavigationView!
    
    public var sentNavigationTitle: String = ""
    private var selectedIndex: IndexPath?

    var offerCompanyList: [CompanyData] = [
        CompanyData(companyName: "구글 코리아", offerDate: "2019. 08. 30", offerState: .none),
        CompanyData(companyIcon: UIImage(systemName: "house"), companyName: "드라마앤 컴패니", offerDate: "2019. 08. 30", offerState: .permit),
        CompanyData(companyIcon: UIImage(systemName: "house"), companyName: "(주)지그재그", offerDate: "2019. 08. 30", offerState: .permit),
        CompanyData(companyIcon: UIImage(systemName: "house"), companyName: "페이스북 코리아", offerDate: "2019. 08. 30", offerState: .deny)
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.offerListTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offerListTableView.dataSource = self
        offerListTableView.delegate = self
        settingNavigation()
    }
    
    private func settingNavigation() {
        navigationUnderLine(sendView: navigationView)
        navigationView.delegate = self
        navigationView.title = "받은 제안"
    }
}

extension OfferViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offerCompanyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeue(type: OfferTableViewCell.self, for: indexPath) else {
            return .init()
        }
        cell.data = offerCompanyList[indexPath.row]
        return cell
    }
}

extension OfferViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "OfferDetailViewController") as? OfferDetailViewController else { return }
        self.selectedIndex = indexPath
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension OfferViewController: OfferDetailViewDelegate {
    func closeCompanyData(_ data: CompanyData) {
        guard let selected = self.selectedIndex else { return }
        offerCompanyList[selected.row].offerState = data.offerState
    }
}

extension OfferViewController: NavigationDelegate {
    func tappedBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
}


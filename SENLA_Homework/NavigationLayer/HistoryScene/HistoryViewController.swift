import UIKit

class HistoryViewController: UIViewController {
    
    var presenter: HistoryPresenter!
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = HistoryPresenter(view: self)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FirstModelCell.self, forCellWithReuseIdentifier: FirstModelCell.identifier)
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        presenter.viewDidLoad()
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}

extension HistoryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FirstModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstModelCell.identifier, for: indexPath) as? FirstModelCell else {
            fatalError("Unable to dequeue FirstModelCell")
        }
        let index = indexPath.row
        let your = FirstModel.shared.statusYourArray(at: indexPath.row)
        let oponent = FirstModel.shared.statusOponentArray(at: indexPath.row)
        cell.configure(with: your, oponent: oponent, index: index)
        return cell
    }
}

extension HistoryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 100)
    }
}

class FirstModelCell: UICollectionViewCell {
    static let identifier = "FirstModelCell"
    
    private let statusOponentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusYourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(statusOponentLabel)
        contentView.addSubview(statusYourLabel)
        
        NSLayoutConstraint.activate([
            statusOponentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            statusOponentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            statusOponentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            statusYourLabel.topAnchor.constraint(equalTo: statusOponentLabel.bottomAnchor, constant: 10),
            statusYourLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            statusYourLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            statusYourLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: FirstModelType, oponent: FirstModelType, index: Int) {
        statusOponentLabel.text = "\(index+1). Status Oponent: \(oponent)"
            statusYourLabel.text = "Status Your: \(model)" // Default value for statusYour
    }
}

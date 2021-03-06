import UIKit

open class SweetTableController: UIViewController {
    open var tableView: UITableView

    public var clearsSelectionOnViewWillAppear = true

    public init(style: UITableView.Style = .plain) {
        let view = UITableView(frame: .zero, style: style)
        view.translatesAutoresizingMaskIntoConstraints = false
        tableView = view

        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder _: NSCoder) {
        fatalError("The method `init?(coder)` is not implemented for this class.")
    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)

        addConstraints()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if clearsSelectionOnViewWillAppear {
            if let indexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }

    func addConstraints() {
        let anchors = [self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor), self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor), self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor), self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)]
        for anchor in anchors {
            anchor.priority = UILayoutPriority.defaultLow
            anchor.isActive = true
        }
    }
}

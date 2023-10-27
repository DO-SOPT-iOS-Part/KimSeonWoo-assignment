import UIKit

class WheatherDetailViewController: UIViewController {
    private let weatherDetailView = WheatherDetailMain()
    private let backgroundImageView = UIImageView(image: UIImage(named: "background"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 폰트 체크 하기
        UIFont.familyNames.sorted().forEach { familyName in
            print("*** \(familyName) ***")
            UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
                print("\(fontName)")
            }
            print("——————————")
        }
        addTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func loadView() {
        view = weatherDetailView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setBackgroundImage()
    }
    
    deinit {
        print(#function)
    }
    
    private func addTarget() {
        weatherDetailView.bottomBar.listButton.addTarget(self, action: #selector(tapListView), for: .touchUpInside)
    }
    
    @objc func tapListView() {
        print("taptaptap")
        self.navigationController?.popViewController(animated: true)
    }
}

extension WheatherDetailViewController {
    private func setBackgroundImage() {
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        view.insertSubview(backgroundImageView, at: 0)
    }
}


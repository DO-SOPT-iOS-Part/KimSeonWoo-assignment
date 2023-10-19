//
//  ViewController.swift
//  assignment1
//
//  Created by Seonwoo Kim on 2023/10/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        // Do any additional setup after loading the view.
        setLayout()
        
        // 폰트 체크 하기
                UIFont.familyNames.sorted().forEach { familyName in
                    print("*** \(familyName) ***")
                    UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
                        print("\(fontName)")
                    }
                    print("——————————")
                }
        
        func doesFontExist(fontName: String) -> Bool {
            return UIFont(name: "SF-Pro", size: 17) != nil
        }

        // 폰트가 존재하는지 확인
        if doesFontExist(fontName: "SF-Pro") {
            print("SF-Pro 폰트가 존재합니다.")
        } else {
            print("SF-Pro 폰트가 존재하지 않습니다.")
        }
    }


    private func setLayout(){
        [바둑알1, 바둑알2, 방어막, label].forEach {
            [weak self] view in
            guard let self else {return}
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([바둑알1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
                                     바둑알1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
                                     바둑알1.widthAnchor.constraint(equalToConstant: 20),
                                     바둑알1.heightAnchor.constraint(equalToConstant: 20),])
        NSLayoutConstraint.activate([바둑알2.topAnchor.constraint(equalTo: self.바둑알1.topAnchor, constant: 40),
                                     바둑알2.leadingAnchor.constraint(equalTo: self.바둑알1.leadingAnchor, constant: 40),
                                     바둑알2.widthAnchor.constraint(equalToConstant: 20),
                                     바둑알2.heightAnchor.constraint(equalToConstant: 20),])
        NSLayoutConstraint.activate([label.topAnchor.constraint(equalTo: self.바둑알2.topAnchor, constant: 40),
                                     label.leadingAnchor.constraint(equalTo: self.바둑알2.leadingAnchor, constant: 40),
                                     label.widthAnchor.constraint(equalToConstant: 80),
                                     label.heightAnchor.constraint(equalToConstant: 20),])
        
        
    }

    var 바둑알1: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    var 바둑알2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    var 방어막: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()

    var label: UILabel = {
        let label = UILabel()
        label.text = "hi m"
        label.textColor = .white
        label.font = UIFont(name: "SF-Pro", size: 50)
        return label
    }()

}

 

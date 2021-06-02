//
//  ViewController.swift
//  Palindrom
//
//  Created by msc on 31.05.2021.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {

    //MARK: - UI
    
    lazy var inputTextView: UITextView = {
       let textView = UITextView()
       textView.text = "Input text here"
        textView.font = .systemFont(ofSize: 16, weight: .regular)
        textView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.textColor = .lightGray
        textView.backgroundColor = .white
        textView.delegate = self
        return textView
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(longestPalindrome), for: .touchUpInside)
        return button
    }()
    
    lazy var outputTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 16, weight: .regular)
        textView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.textColor = .black
        textView.isEditable = false
        textView.isHidden = true
         return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search Palindrom"
        setupLayout()
       
    }

    //MARK: - Methods
    
    @objc func longestPalindrome()  {
        outputTextView.isHidden = false
        var maxLengh = 0
        var maxPalindrome = ""
        let input = inputTextView.text.lowercased().replacingOccurrences(of: " ", with: "")
        for i in input.indices {
            var end = input.index(after: i)
            while end != input.endIndex {
                let word = input[i...end]
                if word == String(word.reversed())  {
                    if word.count > maxLengh {
                        maxLengh = word.count
                        maxPalindrome = String(word)
                    }
                }
                end = input.index(after: end)
            }
        }
        outputTextView.text = maxPalindrome
    }
    
    //MARK: - Layout
    
    private func setupLayout() {
        view.addSubview(inputTextView)
        view.addSubview(searchButton)
        view.addSubview(outputTextView)
        
        inputTextView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(150)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(150)
        }
        searchButton.snp.makeConstraints { (make) in
            make.top.equalTo(inputTextView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
            
        }
        
        outputTextView.snp.makeConstraints { (make) in
            make.top.equalTo(searchButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(150)
        }
    }

}

//MARK: - UITextViewDelegate

extension MainViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        inputTextView.text = ""
        inputTextView.textColor = .black
    }
    
    
}

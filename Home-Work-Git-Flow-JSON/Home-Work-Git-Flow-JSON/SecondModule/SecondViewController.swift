//
//  SecondViewController.swift
//  Home-Work-Git-Flow-JSON
//
//  Created by Bandit on 16.05.2022.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        textFieldAndLabelConstraints()
    }
    
    private func setupViews () {
        view.backgroundColor = UIColor(hexString: "106619")
        view.addSubview(stackview)
    }
    
    private func setupConstraints() {
        stackview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Работа с вводом данных
    
    private lazy var labelbirthData: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "Birth (возраст):"
        label.textColor = UIColor(hexString: "03fc1c")
        return label
    }()
    
    private lazy var birthData: UITextField = {
        var textField = UITextField()
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.textAlignment = .left
        textField.placeholder = "Введите возраст..."
        textField.backgroundColor = .white
        textField.clearButtonMode = .always
        textField.becomeFirstResponder()
        textField.resignFirstResponder()
        textField.textColor = .black
        textField.tintColor = .green
        textField.backgroundColor = .white
       return textField
    }()
    
    var birthInt: Int = 0
//    @IBAction func birthData(_ sender: UITextField) {
//        birthInt = Int(birthData.text ?? "") ?? 0
//    }
    
    private lazy var labelOccupationData: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "Occupation (профессия):"
        label.textColor = UIColor(hexString: "03fc1c")
        return label
    }()
    
    private lazy var occupationData: UITextField = {
        var textField = UITextField()
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.textAlignment = .left
        textField.placeholder = "Введите профессию..."
        textField.backgroundColor = .white
        textField.clearButtonMode = .always
        textField.becomeFirstResponder()
        textField.resignFirstResponder()
        textField.textColor = .black
        textField.tintColor = .green
        textField.backgroundColor = .white
       return textField
    }()
    
    private lazy var labelNameData: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "Name (имя):"
        label.textColor = UIColor(hexString: "03fc1c")
        return label
    }()
    
    private lazy var nameData: UITextField = {
        var textField = UITextField()
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.textAlignment = .left
        textField.placeholder = "Введите имя..."
        textField.backgroundColor = .white
        textField.clearButtonMode = .always
        textField.becomeFirstResponder()
        textField.resignFirstResponder()
        textField.textColor = .black
        textField.tintColor = .green
        textField.backgroundColor = .white
       return textField
    }()
    
    private lazy var labelLastNameData: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "Lastname (фамилия):"
        label.textColor = UIColor(hexString: "03fc1c")
        return label
    }()
    
    private lazy var lastNameData: UITextField = {
        var textField = UITextField()
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.textAlignment = .left
        textField.placeholder = "Введите фамилию..."
        textField.backgroundColor = .white
        textField.clearButtonMode = .always
        textField.becomeFirstResponder()
        textField.resignFirstResponder()
        textField.textColor = .black
        textField.tintColor = .green
        textField.backgroundColor = .white
       return textField
    }()
    
    private lazy var labelCountryData: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "Сountry (страна):"
        label.textColor = UIColor(hexString: "03fc1c")
        return label
    }()
    
    private lazy var countryData: UITextField = {
        var textField = UITextField()
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.textAlignment = .left
        textField.placeholder = "Введите страну..."
        textField.backgroundColor = .white
        textField.clearButtonMode = .always
        textField.becomeFirstResponder()
        textField.resignFirstResponder()
        textField.textColor = .black
        textField.tintColor = .green
        textField.backgroundColor = .white
       return textField
    }()
    
    private lazy var labelText: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "Send request / Отправить запрос"
        label.textColor = UIColor(hexString: "03fc1c")
        return label
    }()
    
    private lazy var urlSessionButton: UIButton = {
        var button = UIButton()
        button.setTitle(" URLSession ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(sendRequestWithURLSession), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonAlomofile: UIButton = {
        var button = UIButton()
        button.setTitle(" Alamofire ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(sendRequestWithAlomoFile), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackview: UIStackView = {
       let stackview = UIStackView()
        stackview.addSubview(labelbirthData)
        stackview.addSubview(birthData)
        stackview.addSubview(labelOccupationData)
        stackview.addSubview(occupationData)
        stackview.addSubview(labelNameData)
        stackview.addSubview(nameData)
        stackview.addSubview(labelLastNameData)
        stackview.addSubview(lastNameData)
        stackview.addSubview(labelCountryData)
        stackview.addSubview(countryData)
        stackview.addSubview(labelText)
        stackview.addSubview(urlSessionButton)
        stackview.addSubview(buttonAlomofile)
        return stackview
    }()
    
    private func textFieldAndLabelConstraints () {
        labelbirthData.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.leading.equalToSuperview().offset(16)
        }
        birthData.snp.makeConstraints { make in
            make.top.equalTo(labelbirthData.snp.top).offset(25)
            make.leading.equalTo(labelbirthData.snp.leading).offset(0)
            make.right.equalToSuperview().offset(-16)
        }
        labelOccupationData.snp.makeConstraints { make in
            make.top.equalTo(birthData.snp.top).offset(35)
            make.leading.equalTo(birthData.snp.leading).offset(0)
        }
        occupationData.snp.makeConstraints { make in
            make.top.equalTo(labelOccupationData.snp.top).offset(25)
            make.leading.equalTo(labelOccupationData.snp.leading).offset(0)
            make.right.equalTo(birthData.snp.right).offset(0)
        }
        labelNameData.snp.makeConstraints { make in
            make.top.equalTo(occupationData.snp.top).offset(35)
            make.leading.equalTo(occupationData.snp.leading).offset(0)
        }
        nameData.snp.makeConstraints { make in
            make.top.equalTo(labelNameData.snp.top).offset(25)
            make.leading.equalTo(labelNameData.snp.leading).offset(0)
            make.right.equalTo(birthData.snp.right).offset(0)
        }
        labelLastNameData.snp.makeConstraints { make in
            make.top.equalTo(nameData.snp.top).offset(35)
            make.leading.equalTo(nameData.snp.leading).offset(0)
        }
        lastNameData.snp.makeConstraints { make in
            make.top.equalTo(labelLastNameData.snp.top).offset(25)
            make.leading.equalTo(labelLastNameData.snp.leading).offset(0)
            make.right.equalTo(birthData.snp.right).offset(0)
        }
        labelCountryData.snp.makeConstraints { make in
            make.top.equalTo(lastNameData.snp.top).offset(35)
            make.leading.equalTo(lastNameData.snp.leading).offset(0)
        }
        countryData.snp.makeConstraints { make in
            make.top.equalTo(labelCountryData.snp.top).offset(25)
            make.leading.equalTo(labelCountryData.snp.leading).offset(0)
            make.right.equalTo(birthData.snp.right).offset(0)
        }
        labelText.snp.makeConstraints { make in
            make.top.equalTo(countryData.snp.top).offset(35)
            make.leading.equalTo(countryData.snp.leading).offset(0)
        }
        urlSessionButton.snp.makeConstraints { make in
            make.top.equalTo(labelText.snp.top).offset(35)
            make.leading.equalTo(labelText.snp.leading).offset(0)
        }
        buttonAlomofile.snp.makeConstraints { make in
            make.top.equalTo(urlSessionButton.snp.top).offset(0)
            make.leading.equalTo(urlSessionButton.snp.leading).offset(120)
        }
    }
    // MARK: - Работа с запросом URLSession
        
    @objc func sendRequestWithURLSession() {
            // Создаем модель и эксемпляр
            let model1 = Json4Swift_Base(birth: birthInt, occupation: occupationData.text!, name: nameData.text!, lastname: lastNameData.text!, country: countryData.text!)
            // Превращаем в JSON
            let jsonData = try? JSONSerialization.data(withJSONObject: [model1.dictionaryRepresentation()])
            // Настраиваем запрос
            var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
            // Метод запроса
            request.httpMethod = "POST"
            // Заголовок запроса
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            // Делем запрос и обработываем ответ
            URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
                guard let data = data, error == nil else {
                    DispatchQueue.main.async {
                        self?.displayFailure()
                    }
                    return
                }
                DispatchQueue.main.async {
                    self?.displaySuccess()
                }
                // Распечатываем ответ в консоль
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                if let responseJSON = responseJSON as? [String: Any] {
                    print(responseJSON)
                }
            }.resume()
        }
        
    // MARK: - Работа с Alamofire

    @objc func sendRequestWithAlomoFile() {
            // Создаем модель
            let item = Item(birth: birthInt, occupation: occupationData.text!, name: nameData.text!, lastName: lastNameData.text!, country: countryData.text!)
            AF.request(
                "https://jsonplaceholder.typicode.com/posts",
                method: .post,
                parameters: item,
                // это та сущность которая превратит наш json в данные
                encoder: JSONParameterEncoder.default
            ).response { [weak self] response in
                guard response.error == nil else {
                    self?.displayFailure()
                    return
                }
                self?.displaySuccess()
                debugPrint(response)
            }
        }
    // MARK: - Работа с Alert
    
    private func displaySuccess() {
        let alert = UIAlertController(title: "Success", message: "Данные отправлены на сервер.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func displayFailure () {
        let alert = UIAlertController(title: "Failure", message: "Ошибка. Обратитесь с техническую поддержку.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


//
//  ViewController.swift
//  JenkinsPipeline
//
//  Created by manjuprashanth s on 08/06/21.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    
    @Published var textfield1Publisher: Bool = false
    @Published var textfield2Publisher: Bool = false
    
    private var validToAdd: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest($textfield1Publisher, $textfield2Publisher)
            .map { value1, value2 in
                return value1 && value2 }.eraseToAnyPublisher()
    }
    
    private var subscriber: AnyCancellable?
    let viewmodel = viewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        subscriber = validToAdd
            .assign(to: \.isEnabled, on: label)
        subscriber = viewmodel.getNames().sink { completion in
            switch completion {
            case .finished:
                print("completed")
            case .failure(let error):
                print(error)
            }
        } receiveValue: { values in
            print(values)
        }
        
//        viewmodel().getNames { result in
//            switch result {
//            case .success(let names):
//                print(names)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
    @IBAction func didTapOnAdd(_ sender: Any) {
        let num1: Int = Int(textfield1.text!)!
        let num2: Int = Int(textfield2.text!)!
        label.text = "\(num1 + num2)"
    }
}

class viewModel {
    
    var didTapAdd: ((String)-> Void)?
    
    var passthrough = PassthroughSubject<String, Never>()
    
    var names = ["manju", "prashanth"]
    
    func getNames() -> Future<[String], Error> {
        return Future { [unowned self] promise in
            promise(.success(self.names))
        }
    }
    
    func callback() {
        passthrough.send("manju")
        didTapAdd?("manju")
    }
    
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
}

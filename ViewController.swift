// https://www.youtube.com/watch?v=lZHNi5PZr4E

import UIKit

class ViewController: UIViewController {
    private let blueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let redButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addButtons()
        view.backgroundColor = .gray
    }
}

private extension ViewController {
    func addButtons() {
        blueButton.frame = CGRect(x: 50,
                            y: UIScreen.main.bounds.height - 150,
                            width: 50,
                            height: 50)
        view.addSubview(blueButton)
        blueButton.addTarget(self, action: #selector(handleBlueButtonTap), for: .touchUpInside)
        
        redButton.frame = CGRect(x: UIScreen.main.bounds.width - 100,
                            y: UIScreen.main.bounds.height - 150,
                            width: 50,
                            height: 50)
        view.addSubview(redButton)
        redButton.addTarget(self, action: #selector(handleRedButtonTap), for: .touchUpInside)
    }
    
    @objc func handleBlueButtonTap() {
        
    }
    
    @objc func handleRedButtonTap() {
        
    }
}

// MARK: -- Focus here
extension ViewController {
    private func addViewOnTap(at point: CGPoint, with color: UIColor) {
        let frameForAddingView = CGRect(x: point.x, y: point.y, width: 50, height: 50)
        let addingView = UIView(frame: frameForAddingView)
        addingView.backgroundColor = color
        view.addSubview(addingView)
    }
}

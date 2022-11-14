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
    
    private var chosenColor: UIColor = .black
    private var colorUsed : [UIColor : Int] = [.black: 0, .blue: 0, .red: 0]

    override func viewDidLoad() {
        super.viewDidLoad()
        addButtons()
        view.backgroundColor = .gray
        addGestureRecognizerForView()
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
        chosenColor = .blue
    }
    
    @objc func handleRedButtonTap() {
        chosenColor = .red
    }
}

// MARK: -- Focus here
private extension ViewController {
    func addGestureRecognizerForView() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleOnVCTap))
        view.addGestureRecognizer(recognizer)
    }
    
    func addViewOnHandlingTap(at point: CGPoint, with color: UIColor) {
        guard let colorCount = getColorCount(color) else {
            return
        }
        
        let frameForAddingView = CGRect(x: point.x, y: point.y, width: 50, height: 50)
//      could youse fly weight
        let addingView = UILabel(frame: frameForAddingView)
        addingView.text = String(colorCount)
        addingView.textAlignment = .center
        
        addingView.backgroundColor = color
        view.addSubview(addingView)
    }
    
    private func getColorCount(_ color: UIColor) -> Int? {
        switch color {
        case .blue:
            return colorUsed[.blue]
        case .red:
            return colorUsed[.red]
        case .black:
            return colorUsed[.black]
        default:
            return nil
        }
    }
    
    @objc func handleOnVCTap(sender: UITapGestureRecognizer) {
        let position = sender.location(in: view)
        addViewOnHandlingTap(at: position, with: chosenColor)
        increateColorCount()
        
    }
    
    private func increateColorCount() {
        switch chosenColor { // Do not use force unwrap
        case .blue:
            colorUsed[.blue]! += 1
        case .red:
            colorUsed[.red]! += 1
        case .black:
            colorUsed[.black]! += 1
        default:
            assertionFailure()
        }
    }
}

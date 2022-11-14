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
    
    private var blueCount = 0
    private var redCount = 0
    private var blackCount = 0

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
        let frameForAddingView = CGRect(x: point.x, y: point.y, width: 50, height: 50)
        let addingView = UILabel(frame: frameForAddingView)
        addingView.textAlignment = .center
        
        switch chosenColor {
        case .blue:
            addingView.text = String(blueCount)
        case .red:
            addingView.text = String(redCount)
        case .black:
            addingView.text = String(blackCount)
        default:
            addingView.text = ""
        }
        
        addingView.backgroundColor = color
        view.addSubview(addingView)
    }
    
    @objc func handleOnVCTap(sender: UITapGestureRecognizer) {
        let position = sender.location(in: view)
        addViewOnHandlingTap(at: position, with: chosenColor)
        
        switch chosenColor {
        case .blue:
            blueCount += 1
        case .red:
            redCount += 1
        case .black:
            blackCount += 1
        default:
            assertionFailure()
        }
    }
}

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    var quizModel = QuizModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        quizModel.questions = Array((quizModel.swiftQuiz.keys))
        quizModel.currentQuestion = quizModel.questions[0]
        questionLabel.text = quizModel.currentQuestion
        progressBar.setProgress(0.1, animated: true)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
            
        if quizModel.checkUserInput(userAnswer: (sender.currentTitle?.lowercased())!) {
            sender.backgroundColor = UIColor.systemGreen
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        } else {
            sender.backgroundColor = UIColor.systemRed
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
    }
    
    @objc func updateUI() {
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        if quizModel.shouldUiUpdate() {
            questionLabel.text = quizModel.updateQuestion()
            progressBar.setProgress(quizModel.progress(), animated: true)
        }
    }
    
}


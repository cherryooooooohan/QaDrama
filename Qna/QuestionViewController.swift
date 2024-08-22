//
//  ViewController.swift
//  Qna
//
//  Created by 🍒 Cherry on 2024/8/22.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var countLabel: UITextField!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var question = [Question]()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        question = [
            Question(que: "張孝全、許瑋甯、王識賢", ans: "誰是被害者"),
            Question(que: "郭子乾、温昇豪、薛仕凌、連俞涵", ans: "茶金"),
            Question(que: "吳慷仁、柯佳嬿、庹宗華、姚淳耀", ans: "模仿犯"),
            Question(que: "林心如、楊一展、許瑋甯、謝佳見", ans: "16個夏天"),
            Question(que: "邱澤、柯佳嬿、曾之喬、張懷秋", ans: "必娶女人"),
            Question(que: "賈靜雯、吳慷仁、陳妤、温昇豪", ans: "我們與惡的距離"),
            Question(que: "周渝民、趙又廷、陳意涵、張鈞甯", ans: "痞子英雄"),
            Question(que: "楊謹華、阮經天、溫昇豪", ans: "敗犬女王"),
            Question(que: "李國毅、任容萱、是元介、翁滋蔓", ans: "我的自由年代"),
            Question(que: "隋棠、溫昇豪、宥勝、朱芯儀", ans: "犀利人妻")
        ]
        
        // 回傳隨機排列後的結果
        question = question.shuffled()
        
        // 顯示第一個問題
        questionLabel.attributedText = formatLabel(question[index].que)
    }

    @IBAction func showAnswer(_ sender: Any) {
        // 顯示此題答案
        answerLabel.attributedText = formatLabel(question[index].ans)
        // 判斷是最後一題
        if index + 1 == question.count {
            nextButton.setTitle("重新開始", for: .normal)
        }
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        
        // 判斷不是最後一題
        if index + 1 < question.count {
            index += 1
        } else {
            index = 0
            nextButton.setTitle("下一題", for: .normal)
            question = question.shuffled()
        }
        // 換題目，清空答案
        questionLabel.attributedText = formatLabel(question[index].que)
        answerLabel.text = ""
        
        // 題號
        countLabel.text = String(format: "%02d    /    %02d", index + 1, question.count)
    }
    
    // 將頓號轉換成換行 & 設定行距
    func formatLabel(_ text: String?) -> NSAttributedString {
        // 頓號
        let formattedText = text?.replacingOccurrences(of: "、", with: "\n")
        
        // 行距
        let textStyle = NSMutableParagraphStyle()
        textStyle.lineSpacing = 12
        textStyle.alignment = .center
        
        // 定義文字屬性的字典
        let textAttributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: textStyle, // 前面設定的行距
            .kern: 3 // 字距
        ]
        
        let finalText = NSAttributedString(string: formattedText ?? "", attributes: textAttributes)
        
        return finalText
    }
}

struct Question {
    var que: String
    var ans: String
    
    init(que: String, ans: String) {
        self.que = que
        self.ans = ans
    }
}


//
//  CodeFromLessonViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 28.09.2022.
//

import UIKit
// Класс конфигурации и отображения текста
final class BookViewController: UIViewController {
    
    // MARK: - Constants
    enum Constants {
        static let fontPickerView = UIPickerView()
        static let allFonts: [String] = UIFont.familyNames
        static let fontStyles: [UIFont.Weight] = [.thin, .light, .regular, .medium, .semibold, .bold, .heavy, .black]
    }
    
    // MARK: - Private visual components
    private lazy var bookTextView: UITextView = {
        let text = UITextView()
        text.frame = CGRect(x: 0, y: 35, width: 350, height: 700)
        text.backgroundColor = .white
        text.isEditable = false
        text.text = """
        Москвы тоже было слишком, после елочных коридоров она приезжим распахивалась как космос. Укутанные люди прыгали из вагонов через ров на платформу, выгружали перехваченные липкой лентой сине-клетчатые китайские баулы, хватали их в обе руки и разгонялись по перронам в перспективу, как штурмовики на взлет по аэродромным полосам. Перспектива была дымной, и в дымке приехавшим людям маячили дворцы, замки и высотки.
        
        Илья больше других не спешил, в потоке не греб — давал себя нести. Нюхал московское небо, присматривался отвыкшими глазами к дали, удивлялся молча. Было ярко, как в детстве. Тусклая ноябрьская Москва резала глаза.—

        Приехать он в Москву приехал, но попасть еще не попал. Вокзал был еще пока территорией окружной, просоленной и засаленной России. Как бангладешское посольство является во всех смыслах территорией государства Бангладеш.

        В конце платформы было сделано сито. Илья его уже издалека привычно разглядел поверх чужих голов. Серая форма, отъеденные морды, глаза рыщущие, цепкие. Наметанные. Раз, раз, раз. И даже собака служебная на цепи: полное сходство. Тут, понятно, она не для того. Тут она просто нюхает себе наркотики, взрывчатку, наверное. Но ведь она и страх может унюхать
        
        Илья стал смотреть в пустоту, чтобы мимо цепких глаз, чтобы не примагнититься к ним. Стал думать ни о чем, чтобы ничем не пахнуть.

        — Молодой человек!

        Он тут же застыл послушно. Как они его узнали? По оттенку кожи? По ссутуленной спине? По голове пригнутой? Как собака зверя узнает?

        — Подойдите. Документы.

        Он отдал паспорт. Листнули на прописку, цыкнули.

        — Откуда возвращаетесь?

        Врать или правду говорить? Не будут же они проверять. Ездил… Ездил куда-нибудь. Отдыхать. К бабке. В командировку. Как они проверят?

        — Отбывал. Наказание.
        """
        return text
    }()
    
    private lazy var textSizeSlider: UISlider = {
        let slider = UISlider()
        slider.frame = CGRect(x: 270, y: 60, width: 200, height: 200)
        slider.transform = slider.transform.rotated(by: CGFloat(1.5 * Float.pi))
        slider.value = 5
        slider.maximumValue = 45
        slider.minimumValue = 15
        slider.minimumValueImage = UIImage(systemName: "textformat.size")
        slider.addTarget(self, action: #selector(changeTextSizeAction), for: .allEvents)
        return slider
    }()
    
    private lazy var orangeTextColorButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 355, y: 290, width: 30, height: 30)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.addTarget(self, action: #selector(changeTextColorAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var blueTextColorButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 355, y: 360, width: 30, height: 30)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.addTarget(self, action: #selector(changeTextColorAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var whiteTextColorButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 355, y: 430, width: 30, height: 30)
        button.backgroundColor = .white
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(changeTextColorAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var grayTextColorButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 355, y: 500, width: 30, height: 30)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.addTarget(self, action: #selector(changeTextColorAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var largeFontStyleButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 335, y: 590, width: 70, height: 50)
        button.setTitle("A", for: .normal)
        button.setTitleColor(UIColor.link, for: .normal)
        button.addTarget(self, action: #selector(changeLargeFontStyleAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var smallFontStyleButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 335, y: 650, width: 70, height: 50)
        button.setTitle("a", for: .normal)
        button.setTitleColor(UIColor.link, for: .normal)
        button.addTarget(self, action: #selector(changeSmallFontStyleAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var pickerViewTextField: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 0, y: 0, width: 230, height: 30)
        field.center = CGPoint(x: 120, y: 780)
        field.placeholder = "Выберите шрифт"
        field.textAlignment = .center
        field.textColor = .darkGray
        return field
    }()
    
    private lazy var darkViewSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 230, y: 765, width: 50, height: 50)
        switcher.addTarget(self, action: #selector(darkViewAction), for: .allEvents)
        return switcher
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.frame = CGRect(x: 320, y: 750, width: 40, height: 45)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(shareTextAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Private propeties
    private var index = 0

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Public methods
    func configUI() {
        view.addSubview(bookTextView)
        view.addSubview(textSizeSlider)
        view.addSubview(orangeTextColorButton)
        view.addSubview(blueTextColorButton)
        view.addSubview(whiteTextColorButton)
        view.addSubview(grayTextColorButton)
        view.addSubview(smallFontStyleButton)
        view.addSubview(largeFontStyleButton)
        view.addSubview(pickerViewTextField)
        view.addSubview(darkViewSwitch)
        view.addSubview(shareButton)
        pickerViewTextField.inputView = Constants.fontPickerView
        Constants.fontPickerView.delegate = self
        Constants.fontPickerView.dataSource = self
    }
    
    // MARK: - Private methods
    @objc private func changeTextSizeAction() {
        bookTextView.font = UIFont(name: pickerViewTextField.text ?? "", size: CGFloat(textSizeSlider.value))
    }
    
    @objc private func changeTextColorAction(_ sender: UIButton) {
        bookTextView.textColor = sender.backgroundColor
    }
    
    @objc private func changeLargeFontStyleAction() {
        index = (index + 1)
        guard index < 8 else { return }
        bookTextView.font = UIFont.systemFont(ofSize: CGFloat(textSizeSlider.value),
                                              weight: Constants.fontStyles[index])
    }
    
    @objc private func changeSmallFontStyleAction() {
        index = (index - 1)
        guard index > 0 else { return }
        bookTextView.font = UIFont.systemFont(ofSize: CGFloat(textSizeSlider.value),
                                              weight: Constants.fontStyles[index])
    }
    
    @objc private func darkViewAction() {
        if darkViewSwitch.isOn {
            view.backgroundColor = .black
            bookTextView.backgroundColor = .black
        } else {
            view.backgroundColor = .white
            bookTextView.backgroundColor = .white
        }
    }
    
    @objc private func shareTextAction() {
        let activityVC = UIActivityViewController(activityItems: [bookTextView.text ?? "Нема текста"],
                                                  applicationActivities: nil)
        present(activityVC, animated: true)
    }
}

// MARK: -UIPickerViewDelegate, UIPickerViewDataSource
extension BookViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.allFonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Constants.allFonts[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerViewTextField.text = Constants.allFonts[row]
        bookTextView.font = UIFont(name: Constants.allFonts[row], size: CGFloat(textSizeSlider.value))
        pickerViewTextField.resignFirstResponder()
    }
}

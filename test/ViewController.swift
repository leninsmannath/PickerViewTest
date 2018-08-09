
import UIKit
class ViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    let myBUtton = UIButton()
    
     var ana = UITextField()
     var sampleTextField = UITextField()
    
    var initialc:[NSLayoutConstraint] = []
    var buttonCons:[NSLayoutConstraint] = []
    var textCons:[NSLayoutConstraint] = []
    var textCons2:[NSLayoutConstraint] = []
    var textAna:[NSLayoutConstraint] = []
    
    var selecteDay : String?
    let dayPicker = UIPickerView()
    
    
    let firstHit = ["","X","9","8","7","6","5","4","3","2","1","0"]
    let secondHit = ["\\","9","8","7","6","5","4","3","2","1","0"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sampleTextField.placeholder = "Enter text here"
        sampleTextField.delegate = self
        sampleTextField.font = UIFont.systemFont(ofSize: 15)
        sampleTextField.translatesAutoresizingMaskIntoConstraints = false
        sampleTextField.borderStyle = UITextBorderStyle.roundedRect
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.clearButtonMode = UITextFieldViewMode.whileEditing;
        sampleTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        
        self.view.addSubview(sampleTextField)
        
        ana.placeholder = "Enter text here"
        ana.delegate = self
        ana.font = UIFont.systemFont(ofSize: 15)
        ana.translatesAutoresizingMaskIntoConstraints = false
        ana.borderStyle = UITextBorderStyle.roundedRect
        ana.autocorrectionType = UITextAutocorrectionType.no
        ana.keyboardType = UIKeyboardType.default
        ana.returnKeyType = UIReturnKeyType.done
        ana.clearButtonMode = UITextFieldViewMode.whileEditing;
        ana.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        
        self.view.addSubview(ana)
        sampleTextField.translatesAutoresizingMaskIntoConstraints = false
        let leadingc2 = sampleTextField.widthAnchor.constraint(equalToConstant: 80)
        let trailingC2 = sampleTextField.heightAnchor.constraint(equalToConstant: 40)
        let topc2 = sampleTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -70)
        let bottomc2 = sampleTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -250)
        
        textCons = [leadingc2,trailingC2,topc2,bottomc2]
        
        
        
        
        let leadingc2a = ana.widthAnchor.constraint(equalToConstant: 80)
        let trailingC2a = ana.heightAnchor.constraint(equalToConstant: 40)
        let topc2a = ana.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 70)
        let bottomc2a = ana.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -250)
        
        textAna = [leadingc2a,trailingC2a,topc2a,bottomc2a]
        
        ana.backgroundColor = .gray
        NSLayoutConstraint.activate(textCons)
        NSLayoutConstraint.activate(textAna)
        createToolBar()
        createDayPicker()
        
    }
    func createDayPicker () {
        dayPicker.tag = 0
        dayPicker.delegate = self
        dayPicker.backgroundColor = .black
        sampleTextField.inputView = dayPicker
        ana.inputView = dayPicker
        
    }
    
    
    func createToolBar()  {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButonnt = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.cancle))
        toolbar.setItems([doneButonnt], animated: false)
        toolbar.isUserInteractionEnabled = true
        sampleTextField.inputAccessoryView = toolbar
        ana.inputAccessoryView = toolbar
    }
    
    @objc func cancle() {
        view.endEditing(true)
        
        
        if sampleTextField.text == "X"{
            
            ana.isHidden = true
            sampleTextField.backgroundColor = .red
            NSLayoutConstraint.deactivate(textCons)
            NSLayoutConstraint.deactivate(textAna)
            
            
            
            sampleTextField.translatesAutoresizingMaskIntoConstraints = false
            let leadingc2 = sampleTextField.widthAnchor.constraint(equalToConstant: 80)
            let trailingC2 = sampleTextField.heightAnchor.constraint(equalToConstant: 40)
            let topc2 = sampleTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -70)
            let bottomc2 = sampleTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -250)
            let rightCona = sampleTextField.rightAnchor.constraint(equalTo: self.view.rightAnchor)
            let leftCona = sampleTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
            textCons2 = [leadingc2,trailingC2,topc2,bottomc2,rightCona,leftCona]
            NSLayoutConstraint.activate(textCons2)
            
            
            
        }
            
        else {
            NSLayoutConstraint.deactivate(textCons2)
            ana.isHidden = false
            
            sampleTextField.translatesAutoresizingMaskIntoConstraints = false
            let leadingc2 = sampleTextField.widthAnchor.constraint(equalToConstant: 80)
            let trailingC2 = sampleTextField.heightAnchor.constraint(equalToConstant: 40)
            let topc2 = sampleTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -70)
            let bottomc2 = sampleTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -250)
            
            textCons = [leadingc2,trailingC2,topc2,bottomc2]
            
            
            
            
            let leadingc2a = ana.widthAnchor.constraint(equalToConstant: 80)
            let trailingC2a = ana.heightAnchor.constraint(equalToConstant: 40)
            let topc2a = ana.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 70)
            let bottomc2a = ana.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -250)
            
            textAna = [leadingc2a,trailingC2a,topc2a,bottomc2a]
            
            ana.backgroundColor = .gray
            NSLayoutConstraint.activate(textCons)
            NSLayoutConstraint.activate(textAna)
        }
        
    }
    
    var activeTextField = UITextField()
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
        dayPicker.reloadAllComponents()
        
    }
    var getArray: [String] {
        if activeTextField == sampleTextField {
            return firstHit
        } else {
            return secondHit
        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return getArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return getArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if activeTextField == sampleTextField {
            sampleTextField.text = getArray[row]
            //
        }
        else {
            //
            ana.text = getArray[row]
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var lable: UILabel
        if let view = view as? UILabel {
            lable = view
        } else {
            lable = UILabel()
        }
        
        lable.textColor = .white
        lable.textAlignment = .center
        lable.font = UIFont(name: "Menlo-Regular", size: 17)
        lable.text = getArray[row]
        return lable
    }
    
}

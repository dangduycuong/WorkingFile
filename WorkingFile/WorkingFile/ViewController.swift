//
//  ViewController.swift
//  WorkingFile
//
//  Created by Cuong on 5/28/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputTextView: UITextView!
    
    @IBOutlet weak var outputTextView: UITextView!
    
    let fileManager = FileManager.default
    
    let fileName = "sampleFile.txt"
    var fm: FileManager?
    var fp: String = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fm = FileManager.default
        let doc = try! fm!.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        fp = doc.appendingPathComponent(fileName).path
    }
    
    func checkFile() {
        let doc = try! fm!.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        fp = doc.appendingPathComponent("Tên tập tin").path
        if fm?.fileExists(atPath: fp) == true {
            // File đã tồn tại
        } else {
            // File chưa tồn tại
        }
    }
    
    @IBAction func writeButton(sender: AnyObject) {
        let data = inputTextView.text
        var os: OutputStream
        if(fm?.fileExists(atPath: fp) == true){
            os = OutputStream(toFileAtPath: fp, append: true)!
            os.open()
            os.write("\n", maxLength: 1)
        } else {
            os = OutputStream(toFileAtPath: fp, append: false)!
            os.open()
        }
        os.write(data!, maxLength: data!.count)
        os.close()
    }
    
    @IBAction func btnRead(sender: AnyObject) {
        if 
    }
    
    @IBAction func btnDelete(sender: AnyObject) {
        do {
            try fm?.removeItem(atPath: fp)
            print("Xoá file thành công!")
        } catch let error as NSError {
            print("Xoá file thất bại)
        }
    }


}


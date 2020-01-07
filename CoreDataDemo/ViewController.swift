//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by apple on 07/01/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        coreDataProcess()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Core Data Saving And Fetching

    func coreDataProcess(){
        
        //Saving CoreData
       
        let appleDelegate=UIApplication.shared.delegate as! AppDelegate
        let  context=appleDelegate.persistentContainer.viewContext
        let entity=NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser=NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue("Balashekar", forKey: "name")
        newUser.setValue("24", forKey: "age")
        newUser.setValue("0123456789", forKey: "password")
        do {
            try context.save()
            print("User Data Sucessfully Saved In CoreData")
        } catch {
            print("Unable to save User data in CoreData")
        }
    
        //Fetching CoreData
        let request=NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults=false
        do {
            let result=try context.fetch(request)
            for data in result as! [NSManagedObject]{
                print(data.value(forKey:"name") as! String)
                print(data.value(forKey: "age")as! String)
                print(data.value(forKey: "password")as! String)
            }
        } catch {
            print("Failed")
        }
        
        
    }
    
}


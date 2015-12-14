//
//  InterfaceController.swift
//  CSC390Final WatchKit Extension
//
//  Created by Abraham Rohde on 12/14/15.
//  Copyright © 2015 Abraham Rohde. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate
{
    
    @IBOutlet var theTable: WKInterfaceTable!
    var session : WCSession!

    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
        self.generateTable()
        if WCSession.isSupported()
        {
            self.session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        
    }
    func generateTable()
    {
        //var tempBibleArray = Singleton.bibleBooksArray
        self.theTable.setNumberOfRows(Singleton.tempBooksArray.count, withRowType: "cell")
        
        
        for (var i = 0; i < Singleton.bibleBooksArray.count-1; i++)
        {
            let random = Int(rand())
            Singleton.randomBibleArray.append(Singleton.tempBooksArray[random % Singleton.tempBooksArray.count])
            print(random % Singleton.tempBooksArray.count)
            Singleton.tempBooksArray.removeAtIndex(random % Singleton.tempBooksArray.count)
        }
        
        for(var i = 0; i < Singleton.bibleBooksArray.count-1; i++)
        {
            let currRow = self.theTable.rowControllerAtIndex(i) as! bibleRow
            if(i == 0)
            {
                
            }
            else
            {
                currRow.nameLabel.setText(Singleton.randomBibleArray[i-1])
            }
            
        }
    }
    func checkCorrectGuess(bibleBook : String) -> Bool
    {
        //check if the guess is correct. If it is, remove from Singleton.randomBibleArray and add to Singleton.currBibleBooks
        return true
    }
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int)
    {
        if(rowIndex == 0)
        {
            // This is the button that brings them to the next page
        }
        self.checkCorrectGuess(Singleton.randomBibleArray[rowIndex + 1])
        Singleton.numberOfGuesses += 1
        print(Singleton.numberOfGuesses)
        if(Singleton.numberOfGuesses == 5)//If they have completed the game
        {
            session.sendMessage(["attempts" : Singleton.numberOfGuesses], replyHandler: nil, errorHandler: nil)
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

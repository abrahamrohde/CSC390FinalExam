//
//  Singleton.swift
//  CSC390Final
//
//  Created by Abraham Rohde on 12/14/15.
//  Copyright © 2015 Abraham Rohde. All rights reserved.
//

import WatchKit

class Singleton: NSObject
{
    static let bibleBooksString = "Genesis,Exodus,Leviticus,Numbers,Deuteronomy,Joshua,Judges,Ruth,1 Samuel,2 Samuel,1 Kings,2 Kings,1 Chronicles,2 Chronicles,Ezra,Nehemiah,Esther,Job,Psalms,Proverbs,Ecclesiastes,Song of Solomon,Isaiah,Jeremiah,Lamentations,Ezekiel,Daniel,Hosea,Joel,Amos,Obadiah,Jonah,Micah,Nahum,Habakkuk,Zephaniah,Haggai,Zechariah,Malachi,Matthew,Mark,Luke,John,Acts,Romans,1 Corinthians,2 Corinthians,Galatians,Ephesians,Philippians,Colossians,1 Thessalonians,2 Thessalonians,1 Timothy,2 Timothy,Titus,Philemon,Hebrews,James,1 Peter,2 Peter,1 John,2 John,3 John,Jude,Revelation"
    static let bibleBooksArray = Singleton.bibleBooksString.componentsSeparatedByString(",")
    static var tempBooksArray = Singleton.bibleBooksString.componentsSeparatedByString(",")
    static var currBibleBooks = [String]()
    static var randomBibleArray = [String]()
    static var numberOfGuesses = 0
}

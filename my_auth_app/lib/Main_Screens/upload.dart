import 'package:cloud_firestore/cloud_firestore.dart';

final List<Map<String, String>> quotes = [
  {
    "quote": "The best way to predict the future is to invent it.",
    "author": "Alan Kay"
  },
  {
    "quote": "Life is 10% what happens to us and 90% how we react to it.",
    "author": "Charles R. Swindoll"
  },
  {
    "quote":
        "The only limit to our realization of tomorrow is our doubts of today.",
    "author": "Franklin D. Roosevelt"
  },
  {
    "quote":
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "author": "Winston Churchill"
  },
  {
    "quote": "Believe you can and you're halfway there.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote": "The only way to do great work is to love what you do.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s not whether you get knocked down, it’s whether you get up.",
    "author": "Vince Lombardi"
  },
  {
    "quote":
        "Success is not the key to happiness. Happiness is the key to success.",
    "author": "Albert Schweitzer"
  },
  {"quote": "The best revenge is massive success.", "author": "Frank Sinatra"},
  {
    "quote": "Don’t let yesterday take up too much of today.",
    "author": "Will Rogers"
  },
  {
    "quote": "You miss 100% of the shots you don’t take.",
    "author": "Wayne Gretzky"
  },
  {
    "quote":
        "The future belongs to those who believe in the beauty of their dreams.",
    "author": "Eleanor Roosevelt"
  },
  {
    "quote": "You must be the change you wish to see in the world.",
    "author": "Mahatma Gandhi"
  },
  {
    "quote":
        "The only limit to our realization of tomorrow is our doubts of today.",
    "author": "Franklin D. Roosevelt"
  },
  {
    "quote":
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "author": "Winston Churchill"
  },
  {
    "quote": "Believe you can and you're halfway there.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s hard to beat a person who never gives up.",
    "author": "Babe Ruth"
  },
  {
    "quote":
        "Success is not about how much money you make, it’s about the difference you make in people’s lives.",
    "author": "Michelle Obama"
  },
  {
    "quote":
        "The only place where success comes before work is in the dictionary.",
    "author": "Vidal Sassoon"
  },
  {
    "quote": "Do what you can with all you have, wherever you are.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote":
        "Hardships often prepare ordinary people for an extraordinary destiny.",
    "author": "C.S. Lewis"
  },
  {
    "quote": "Don't watch the clock; do what it does. Keep going.",
    "author": "Sam Levenson"
  },
  {
    "quote":
        "Success is not the key to happiness. Happiness is the key to success.",
    "author": "Albert Schweitzer"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s not whether you get knocked down, it’s whether you get up.",
    "author": "Vince Lombardi"
  },
  {
    "quote":
        "The future belongs to those who believe in the beauty of their dreams.",
    "author": "Eleanor Roosevelt"
  },
  {
    "quote": "You must be the change you wish to see in the world.",
    "author": "Mahatma Gandhi"
  },
  {
    "quote":
        "The only limit to our realization of tomorrow is our doubts of today.",
    "author": "Franklin D. Roosevelt"
  },
  {
    "quote":
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "author": "Winston Churchill"
  },
  {
    "quote": "Believe you can and you're halfway there.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s hard to beat a person who never gives up.",
    "author": "Babe Ruth"
  },
  {
    "quote":
        "Success is not about how much money you make, it’s about the difference you make in people’s lives.",
    "author": "Michelle Obama"
  },
  {
    "quote":
        "The only place where success comes before work is in the dictionary.",
    "author": "Vidal Sassoon"
  },
  {
    "quote": "Do what you can with all you have, wherever you are.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote":
        "Hardships often prepare ordinary people for an extraordinary destiny.",
    "author": "C.S. Lewis"
  },
  {
    "quote": "Don't watch the clock; do what it does. Keep going.",
    "author": "Sam Levenson"
  },
  {
    "quote":
        "Success is not the key to happiness. Happiness is the key to success.",
    "author": "Albert Schweitzer"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s not whether you get knocked down, it’s whether you get up.",
    "author": "Vince Lombardi"
  },
  {
    "quote":
        "The future belongs to those who believe in the beauty of their dreams.",
    "author": "Eleanor Roosevelt"
  },
  {
    "quote": "You must be the change you wish to see in the world.",
    "author": "Mahatma Gandhi"
  },
  {
    "quote":
        "The only limit to our realization of tomorrow is our doubts of today.",
    "author": "Franklin D. Roosevelt"
  },
  {
    "quote":
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "author": "Winston Churchill"
  },
  {
    "quote": "Believe you can and you're halfway there.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s hard to beat a person who never gives up.",
    "author": "Babe Ruth"
  },
  {
    "quote":
        "Success is not about how much money you make, it’s about the difference you make in people’s lives.",
    "author": "Michelle Obama"
  },
  {
    "quote":
        "The only place where success comes before work is in the dictionary.",
    "author": "Vidal Sassoon"
  },
  {
    "quote": "Do what you can with all you have, wherever you are.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote":
        "Hardships often prepare ordinary people for an extraordinary destiny.",
    "author": "C.S. Lewis"
  },
  {
    "quote": "Don't watch the clock; do what it does. Keep going.",
    "author": "Sam Levenson"
  },
  {
    "quote":
        "Success is not the key to happiness. Happiness is the key to success.",
    "author": "Albert Schweitzer"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s not whether you get knocked down, it’s whether you get up.",
    "author": "Vince Lombardi"
  },
  {
    "quote":
        "The future belongs to those who believe in the beauty of their dreams.",
    "author": "Eleanor Roosevelt"
  },
  {
    "quote": "You must be the change you wish to see in the world.",
    "author": "Mahatma Gandhi"
  },
  {
    "quote":
        "The only limit to our realization of tomorrow is our doubts of today.",
    "author": "Franklin D. Roosevelt"
  },
  {
    "quote":
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "author": "Winston Churchill"
  },
  {
    "quote": "Believe you can and you're halfway there.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s hard to beat a person who never gives up.",
    "author": "Babe Ruth"
  },
  {
    "quote":
        "Success is not about how much money you make, it’s about the difference you make in people’s lives.",
    "author": "Michelle Obama"
  },
  {
    "quote":
        "The only place where success comes before work is in the dictionary.",
    "author": "Vidal Sassoon"
  },
  {
    "quote": "Do what you can with all you have, wherever you are.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote":
        "Hardships often prepare ordinary people for an extraordinary destiny.",
    "author": "C.S. Lewis"
  },
  {
    "quote": "Don't watch the clock; do what it does. Keep going.",
    "author": "Sam Levenson"
  },
  {
    "quote":
        "Success is not the key to happiness. Happiness is the key to success.",
    "author": "Albert Schweitzer"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s not whether you get knocked down, it’s whether you get up.",
    "author": "Vince Lombardi"
  },
  {
    "quote":
        "The future belongs to those who believe in the beauty of their dreams.",
    "author": "Eleanor Roosevelt"
  },
  {
    "quote": "You must be the change you wish to see in the world.",
    "author": "Mahatma Gandhi"
  },
  {
    "quote":
        "The only limit to our realization of tomorrow is our doubts of today.",
    "author": "Franklin D. Roosevelt"
  },
  {
    "quote":
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "author": "Winston Churchill"
  },
  {
    "quote": "Believe you can and you're halfway there.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s hard to beat a person who never gives up.",
    "author": "Babe Ruth"
  },
  {
    "quote":
        "Success is not about how much money you make, it’s about the difference you make in people’s lives.",
    "author": "Michelle Obama"
  },
  {
    "quote":
        "The only place where success comes before work is in the dictionary.",
    "author": "Vidal Sassoon"
  },
  {
    "quote": "Do what you can with all you have, wherever you are.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote":
        "Hardships often prepare ordinary people for an extraordinary destiny.",
    "author": "C.S. Lewis"
  },
  {
    "quote": "Don't watch the clock; do what it does. Keep going.",
    "author": "Sam Levenson"
  },
  {
    "quote":
        "Success is not the key to happiness. Happiness is the key to success.",
    "author": "Albert Schweitzer"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s not whether you get knocked down, it’s whether you get up.",
    "author": "Vince Lombardi"
  },
  {
    "quote":
        "The future belongs to those who believe in the beauty of their dreams.",
    "author": "Eleanor Roosevelt"
  },
  {
    "quote": "You must be the change you wish to see in the world.",
    "author": "Mahatma Gandhi"
  },
  {
    "quote":
        "The only limit to our realization of tomorrow is our doubts of today.",
    "author": "Franklin D. Roosevelt"
  },
  {
    "quote":
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "author": "Winston Churchill"
  },
  {
    "quote": "Believe you can and you're halfway there.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s hard to beat a person who never gives up.",
    "author": "Babe Ruth"
  },
  {
    "quote":
        "Success is not about how much money you make, it’s about the difference you make in people’s lives.",
    "author": "Michelle Obama"
  },
  {
    "quote":
        "The only place where success comes before work is in the dictionary.",
    "author": "Vidal Sassoon"
  },
  {
    "quote": "Do what you can with all you have, wherever you are.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote":
        "Hardships often prepare ordinary people for an extraordinary destiny.",
    "author": "C.S. Lewis"
  },
  {
    "quote": "Don't watch the clock; do what it does. Keep going.",
    "author": "Sam Levenson"
  },
  {
    "quote":
        "Success is not the key to happiness. Happiness is the key to success.",
    "author": "Albert Schweitzer"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s not whether you get knocked down, it’s whether you get up.",
    "author": "Vince Lombardi"
  },
  {
    "quote":
        "The future belongs to those who believe in the beauty of their dreams.",
    "author": "Eleanor Roosevelt"
  },
  {
    "quote": "You must be the change you wish to see in the world.",
    "author": "Mahatma Gandhi"
  },
  {
    "quote":
        "The only limit to our realization of tomorrow is our doubts of today.",
    "author": "Franklin D. Roosevelt"
  },
  {
    "quote":
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "author": "Winston Churchill"
  },
  {
    "quote": "Believe you can and you're halfway there.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s hard to beat a person who never gives up.",
    "author": "Babe Ruth"
  },
  {
    "quote":
        "Success is not about how much money you make, it’s about the difference you make in people’s lives.",
    "author": "Michelle Obama"
  },
  {
    "quote":
        "The only place where success comes before work is in the dictionary.",
    "author": "Vidal Sassoon"
  },
  {
    "quote": "Do what you can with all you have, wherever you are.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote":
        "Hardships often prepare ordinary people for an extraordinary destiny.",
    "author": "C.S. Lewis"
  },
  {
    "quote": "Don't watch the clock; do what it does. Keep going.",
    "author": "Sam Levenson"
  },
  {
    "quote":
        "Success is not the key to happiness. Happiness is the key to success.",
    "author": "Albert Schweitzer"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s not whether you get knocked down, it’s whether you get up.",
    "author": "Vince Lombardi"
  },
  {
    "quote":
        "The future belongs to those who believe in the beauty of their dreams.",
    "author": "Eleanor Roosevelt"
  },
  {
    "quote": "You must be the change you wish to see in the world.",
    "author": "Mahatma Gandhi"
  },
  {
    "quote":
        "The only limit to our realization of tomorrow is our doubts of today.",
    "author": "Franklin D. Roosevelt"
  },
  {
    "quote":
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "author": "Winston Churchill"
  },
  {
    "quote": "Believe you can and you're halfway there.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s hard to beat a person who never gives up.",
    "author": "Babe Ruth"
  },
  {
    "quote":
        "Success is not about how much money you make, it’s about the difference you make in people’s lives.",
    "author": "Michelle Obama"
  },
  {
    "quote":
        "The only place where success comes before work is in the dictionary.",
    "author": "Vidal Sassoon"
  },
  {
    "quote": "Do what you can with all you have, wherever you are.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote":
        "Hardships often prepare ordinary people for an extraordinary destiny.",
    "author": "C.S. Lewis"
  },
  {
    "quote": "Don't watch the clock; do what it does. Keep going.",
    "author": "Sam Levenson"
  },
  {
    "quote":
        "Success is not the key to happiness. Happiness is the key to success.",
    "author": "Albert Schweitzer"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s not whether you get knocked down, it’s whether you get up.",
    "author": "Vince Lombardi"
  },
  {
    "quote":
        "The future belongs to those who believe in the beauty of their dreams.",
    "author": "Eleanor Roosevelt"
  },
  {
    "quote": "You must be the change you wish to see in the world.",
    "author": "Mahatma Gandhi"
  },
  {
    "quote":
        "The only limit to our realization of tomorrow is our doubts of today.",
    "author": "Franklin D. Roosevelt"
  },
  {
    "quote":
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "author": "Winston Churchill"
  },
  {
    "quote": "Believe you can and you're halfway there.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s hard to beat a person who never gives up.",
    "author": "Babe Ruth"
  },
  {
    "quote":
        "Success is not about how much money you make, it’s about the difference you make in people’s lives.",
    "author": "Michelle Obama"
  },
  {
    "quote":
        "The only place where success comes before work is in the dictionary.",
    "author": "Vidal Sassoon"
  },
  {
    "quote": "Do what you can with all you have, wherever you are.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote":
        "Hardships often prepare ordinary people for an extraordinary destiny.",
    "author": "C.S. Lewis"
  },
  {
    "quote": "Don't watch the clock; do what it does. Keep going.",
    "author": "Sam Levenson"
  },
  {
    "quote":
        "Success is not the key to happiness. Happiness is the key to success.",
    "author": "Albert Schweitzer"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s not whether you get knocked down, it’s whether you get up.",
    "author": "Vince Lombardi"
  },
  {
    "quote":
        "The future belongs to those who believe in the beauty of their dreams.",
    "author": "Eleanor Roosevelt"
  },
  {
    "quote": "You must be the change you wish to see in the world.",
    "author": "Mahatma Gandhi"
  },
  {
    "quote":
        "The only limit to our realization of tomorrow is our doubts of today.",
    "author": "Franklin D. Roosevelt"
  },
  {
    "quote":
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "author": "Winston Churchill"
  },
  {
    "quote": "Believe you can and you're halfway there.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s hard to beat a person who never gives up.",
    "author": "Babe Ruth"
  },
  {
    "quote":
        "Success is not about how much money you make, it’s about the difference you make in people’s lives.",
    "author": "Michelle Obama"
  },
  {
    "quote":
        "The only place where success comes before work is in the dictionary.",
    "author": "Vidal Sassoon"
  },
  {
    "quote": "Do what you can with all you have, wherever you are.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote":
        "Hardships often prepare ordinary people for an extraordinary destiny.",
    "author": "C.S. Lewis"
  },
  {
    "quote": "Don't watch the clock; do what it does. Keep going.",
    "author": "Sam Levenson"
  },
  {
    "quote":
        "Success is not the key to happiness. Happiness is the key to success.",
    "author": "Albert Schweitzer"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s not whether you get knocked down, it’s whether you get up.",
    "author": "Vince Lombardi"
  },
  {
    "quote":
        "The future belongs to those who believe in the beauty of their dreams.",
    "author": "Eleanor Roosevelt"
  },
  {
    "quote": "You must be the change you wish to see in the world.",
    "author": "Mahatma Gandhi"
  },
  {
    "quote":
        "The only limit to our realization of tomorrow is our doubts of today.",
    "author": "Franklin D. Roosevelt"
  },
  {
    "quote":
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "author": "Winston Churchill"
  },
  {
    "quote": "Believe you can and you're halfway there.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s hard to beat a person who never gives up.",
    "author": "Babe Ruth"
  },
  {
    "quote":
        "Success is not about how much money you make, it’s about the difference you make in people’s lives.",
    "author": "Michelle Obama"
  },
  {
    "quote":
        "The only place where success comes before work is in the dictionary.",
    "author": "Vidal Sassoon"
  },
  {
    "quote": "Do what you can with all you have, wherever you are.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote":
        "Hardships often prepare ordinary people for an extraordinary destiny.",
    "author": "C.S. Lewis"
  },
  {
    "quote": "Don't watch the clock; do what it does. Keep going.",
    "author": "Sam Levenson"
  },
  {
    "quote":
        "Success is not the key to happiness. Happiness is the key to success.",
    "author": "Albert Schweitzer"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s not whether you get knocked down, it’s whether you get up.",
    "author": "Vince Lombardi"
  },
  {
    "quote":
        "The future belongs to those who believe in the beauty of their dreams.",
    "author": "Eleanor Roosevelt"
  },
  {
    "quote": "You must be the change you wish to see in the world.",
    "author": "Mahatma Gandhi"
  },
  {
    "quote":
        "The only limit to our realization of tomorrow is our doubts of today.",
    "author": "Franklin D. Roosevelt"
  },
  {
    "quote":
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "author": "Winston Churchill"
  },
  {
    "quote": "Believe you can and you're halfway there.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s hard to beat a person who never gives up.",
    "author": "Babe Ruth"
  },
  {
    "quote":
        "Success is not about how much money you make, it’s about the difference you make in people’s lives.",
    "author": "Michelle Obama"
  },
  {
    "quote":
        "The only place where success comes before work is in the dictionary.",
    "author": "Vidal Sassoon"
  },
  {
    "quote": "Do what you can with all you have, wherever you are.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote":
        "Hardships often prepare ordinary people for an extraordinary destiny.",
    "author": "C.S. Lewis"
  },
  {
    "quote": "Don't watch the clock; do what it does. Keep going.",
    "author": "Sam Levenson"
  },
  {
    "quote":
        "Success is not the key to happiness. Happiness is the key to success.",
    "author": "Albert Schweitzer"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s not whether you get knocked down, it’s whether you get up.",
    "author": "Vince Lombardi"
  },
  {
    "quote":
        "The future belongs to those who believe in the beauty of their dreams.",
    "author": "Eleanor Roosevelt"
  },
  {
    "quote": "You must be the change you wish to see in the world.",
    "author": "Mahatma Gandhi"
  },
  {
    "quote":
        "The only limit to our realization of tomorrow is our doubts of today.",
    "author": "Franklin D. Roosevelt"
  },
  {
    "quote":
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "author": "Winston Churchill"
  },
  {
    "quote": "Believe you can and you're halfway there.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s hard to beat a person who never gives up.",
    "author": "Babe Ruth"
  },
  {
    "quote":
        "Success is not about how much money you make, it’s about the difference you make in people’s lives.",
    "author": "Michelle Obama"
  },
  {
    "quote":
        "The only place where success comes before work is in the dictionary.",
    "author": "Vidal Sassoon"
  },
  {
    "quote": "Do what you can with all you have, wherever you are.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote":
        "Hardships often prepare ordinary people for an extraordinary destiny.",
    "author": "C.S. Lewis"
  },
  {
    "quote": "Don't watch the clock; do what it does. Keep going.",
    "author": "Sam Levenson"
  },
  {
    "quote":
        "Success is not the key to happiness. Happiness is the key to success.",
    "author": "Albert Schweitzer"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s not whether you get knocked down, it’s whether you get up.",
    "author": "Vince Lombardi"
  },
  {
    "quote":
        "The future belongs to those who believe in the beauty of their dreams.",
    "author": "Eleanor Roosevelt"
  },
  {
    "quote": "You must be the change you wish to see in the world.",
    "author": "Mahatma Gandhi"
  },
  {
    "quote":
        "The only limit to our realization of tomorrow is our doubts of today.",
    "author": "Franklin D. Roosevelt"
  },
  {
    "quote":
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "author": "Winston Churchill"
  },
  {
    "quote": "Believe you can and you're halfway there.",
    "author": "Theodore Roosevelt"
  },
  {
    "quote": "Your time is limited, don’t waste it living someone else’s life.",
    "author": "Steve Jobs"
  },
  {
    "quote": "It’s hard to beat a person who never gives up.",
    "author": "Babe Ruth"
  },
  {
    "quote":
        "Success is not about how much money you make, it’s about the difference you make in people’s lives.",
    "author": "Michelle Obama"
  }
];
void storeQuotes() async {
  CollectionReference quotesCollection =
      FirebaseFirestore.instance.collection('quotes');
  for (var quote in quotes) {
    await quotesCollection.add(quote);
  }
}

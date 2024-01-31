import 'dart:collection';

import '../model/model_screen.dart';

List<Map>quotesList=[
  {"author":"Marilyn Monroe","quotes":"“I'm selfish, impatient and a little insecure. I make mistakes, I am out of control and at times hard to handle. But if you can't handle me at my worst, then you sure as hell don't deserve me at my best.”","category":"life"},
  {"author":"William W. Purkey","quotes":"“You've gotta dance like there's nobody watching,","category":"life"},
  {"author":"Mae West","quotes":"“You only live once, but if you do it right, once is enough.”","category":"life"},
  {"author":"Herbert Bayard Swope","quotes":"“I can't give you a sure-fire formula for success, but I can give you a formula for failure: try to please everybody all the time.”","category":"success"},
  {"author":"Albert Einstein","quotes":"“Try not to become a man of success. Rather become a man of value.”","category":"success"},

];
List<QuotesModel> quotesModelList=[];
void convert()
{
  quotesModelList=quotesList.map((e) => QuotesModel.setdata(e)).toList();
  print(quotesModelList[0].quotes);

}

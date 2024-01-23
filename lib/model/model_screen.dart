class QuotesModel
{
  String? quotes,author,category;

   QuotesModel({this.quotes,this.author, this.category});

   QuotesModel.maptoModel();
   factory QuotesModel.setdata(Map m1)
   {
     return QuotesModel(author: m1['author'],category: m1['category'],quotes: m1['quotes']);
   }
}
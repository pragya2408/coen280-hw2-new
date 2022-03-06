select Y.First_Name,R.Publish_Date
   From Reviews R,  YelpUser Y
   where Y.YELP_ID= R. Author AND R.BUSINESS_ID IN ( select B.Business_Id
   From Reviews R2, YelpBusiness B
  Where B.B_Name='China Coffee Toffee' AND R2.Stars='5' AND R2.Publish_Date >'2007-01-01 00:00:00')
    order by R.Publish_Date
;
select Y.First_Name
   From YelpUser Y, Reviews R, YelpBusiness B
   Where B.State='OH' AND B.Business_Id=R.BUSINESS_ID AND Y.YELP_ID= R.AUTHOR;

/*8. How many Invoices were there in 2009 and 2011? What are the respective total sales for each of
those years?*/

/*select year(i.InvoiceDate) as 'year', count(i.InvoiceId) as 'total sales'
	from invoice i
    group by year
    having year in (2009, 2011);*/
    
    /*select year(InvoiceDate) as year, count(*) as 'total sales'
		from invoice
		group by  year
        having  year = 2009 or year = 2011;*/
        
        select year(InvoiceDate) as year, sum(invoice.total) as 'total sales'
		from invoice
		group by  year
        having  year = 2009 or year = 2011;
    
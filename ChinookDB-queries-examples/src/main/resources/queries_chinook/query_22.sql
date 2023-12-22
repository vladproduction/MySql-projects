/*22.Provide a query that shows the total sales per country.*/

select BillingCountry, sum(Total)
    from invoice
    group by BillingCountry
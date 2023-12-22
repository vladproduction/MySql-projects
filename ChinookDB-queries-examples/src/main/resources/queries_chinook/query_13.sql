/*13. Provide a query that shows the # of invoices per country. HINT: GROUP BY*/

select BillingCountry, count(i.InvoiceId)
    from invoice i
    group by BillingCountry
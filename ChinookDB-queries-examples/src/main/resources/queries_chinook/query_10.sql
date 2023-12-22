/*10. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for
each Invoice. HINT: GROUP BY*/

select InvoiceId, count(il.InvoiceId)
    from invoiceline il
    group by InvoiceId
/*23.Which country’s customers spent the most?*/

select BillingCountry as country, sum(Total) as spent
from invoice
group by BillingCountry
order by spent desc
limit 1;

# select Country, max(CustomerCount) as MaxCustomers
#     from (select Country, count(*) as CustomerCount from customer group by Country) as CountryCounts
#     group by Country;

SELECT InvoiceId,CustomerId,Total FROM invoices ORDER BY CustomerId ASC  ; 
SELECT InvoiceId,CustomerId,Total FROM invoices ORDER BY Total DESC , CustomerId ASC ;
SELECT InvoiceId,CustomerId,Total FROM invoices ORDER BY  CustomerId ASC ,Total DESC  ;
SELECT * FROM invoices WHERE Total >=10  ORDER BY  Total DESC LIMIT 10;
SELECT * FROM invoices WHERE Total < 10  ORDER BY  Total DESC LIMIT 5;
SELECT Name FROM tracks WHERE Name LIKE "B%s"  ;
SELECT * 
FROM invoices 
WHERE (BillingCountry="USA" OR BillingCountry="Germany" OR BillingCountry="Norway" OR BillingCountry="Canada") AND InvoiceDate LIKE "2010%"
ORDER BY InvoiceDate DESC;
--Query 4:  Write a query that lists all the customers that listen to 
--longer-than-average tracks, excluding the tracks that are longer than 15 minutes. 

SELECT DISTINCT customers.CustomerId, customers.FirstName, customers.LastName
FROM tracks
INNER JOIN invoice_items ON tracks.TrackId=invoice_items.TrackId
INNER JOIN invoices ON invoice_items.InvoiceId=invoices.InvoiceId
INNER JOIN customers ON invoices.CustomerId=customers.CustomerId
--filters out all tracks that have above average length and are less than 15 minutes
WHERE Milliseconds < 1000*60*15 AND Milliseconds > (SELECT avg(Milliseconds) FROM tracks);
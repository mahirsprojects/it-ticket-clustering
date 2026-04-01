// Visualising Data
SELECT 
    COUNT(*) as total_tickets,
    COUNT(DISTINCT TicketType) as unique_ticket_types,
    COUNT(DISTINCT TicketSubject) as unique_subjects,
    COUNT(DISTINCT TicketPriority) as unique_priorities,
    COUNT(DISTINCT ProductPurchased) as unique_products
FROM tickets t ;

// OUTPUT: total_tickets: 8469	unique_ticket_types: 5	unique_subjects:16	unique_priorities: 4	unique_products: 42
// Cleaning Data
CREATE TABLE model_input AS
SELECT 
    TicketID,
    TicketType,
    TicketSubject,
    TicketPriority,
    TicketChannel,
    ProductPurchased,
    CustomerSatisfactionRating,
    TimetoResolution,
    FirstResponseTime
FROM tickets
WHERE TimetoResolution IS NOT NULL
  AND TimetoResolution != ''
  AND TicketPriority IS NOT NULL
  AND TicketStatus = 'Closed';
// Counting Total relevant tickets
ELECT
COUNT (*) as total_tickets
FROM model_input;
// OUTPUT: total_tickets: 2,769

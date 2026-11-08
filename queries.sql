-- Q1: Open and overdue invoices with payment attempt count.
SELECT i.invoice_id, o.org_name, i.status, i.amount_cents, i.currency,
       COUNT(p.payment_id) AS payment_attempts
FROM invoices AS i
JOIN organizations AS o ON o.org_id = i.org_id
LEFT JOIN payments AS p ON p.invoice_id = i.invoice_id
WHERE i.status IN ('open', 'past_due')
GROUP BY i.invoice_id, o.org_name, i.status, i.amount_cents, i.currency
ORDER BY i.invoice_id;

-- Q2: Failed payments; do not assume retry authorization.
SELECT i.invoice_id, p.payment_id, p.attempted_at, p.failure_category
FROM payments AS p JOIN invoices AS i ON i.invoice_id = p.invoice_id
WHERE p.status = 'failed'
ORDER BY p.attempted_at;

-- Q3: Flag possible duplicate successful payments for human review.
SELECT invoice_id, COUNT(*) AS successful_payments, SUM(amount_cents) AS total_cents
FROM payments WHERE status = 'succeeded'
GROUP BY invoice_id HAVING COUNT(*) > 1;

-- Q4: Open invoices with pending payment attempts.
SELECT i.invoice_id, p.payment_id, p.attempted_at, p.status
FROM invoices AS i JOIN payments AS p ON p.invoice_id = i.invoice_id
WHERE i.status = 'open' AND p.status = 'pending';

-- Q5: Daily compute usage by organization (fictional units).
SELECT o.org_name, u.occurred_at, SUM(u.units) AS total_units
FROM usage_events AS u JOIN organizations AS o ON o.org_id = u.org_id
WHERE u.resource_type = 'compute_hours'
GROUP BY o.org_name, u.occurred_at
ORDER BY o.org_name, u.occurred_at;

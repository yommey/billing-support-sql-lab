INSERT INTO organizations VALUES
(1, 'Example Dev Studio', 'Pro'),
(2, 'Demo Research Group', 'Team'),
(3, 'Sample Product Co', 'Pro'),
(4, 'Fictional Labs', 'Free');

INSERT INTO invoices VALUES
('INV-1001',1,'2026-10-01','2026-10-15',2500,'USD','paid'),
('INV-1002',1,'2026-11-01','2026-11-15',4200,'USD','open'),
('INV-2001',2,'2026-10-01','2026-10-15',7500,'USD','past_due'),
('INV-3001',3,'2026-11-01','2026-11-15',3900,'USD','paid'),
('INV-3002',3,'2026-10-01','2026-10-15',3500,'USD','paid');

INSERT INTO payments VALUES
('PAY-01','INV-1001','2026-10-01T09:00:00Z',2500,'succeeded',NULL),
('PAY-02','INV-1002','2026-11-02T10:00:00Z',4200,'pending',NULL),
('PAY-03','INV-2001','2026-10-15T09:30:00Z',7500,'failed','issuer_declined'),
('PAY-04','INV-2001','2026-10-17T09:30:00Z',7500,'failed','authentication_required'),
('PAY-05','INV-3001','2026-11-01T08:00:00Z',3900,'succeeded',NULL),
('PAY-06','INV-3001','2026-11-01T08:02:00Z',3900,'succeeded',NULL),
('PAY-07','INV-3002','2026-10-01T08:00:00Z',3500,'succeeded',NULL);

INSERT INTO usage_events VALUES
(1,1,'2026-10-30','compute_hours',20),
(2,1,'2026-10-31','compute_hours',21),
(3,1,'2026-11-01','compute_hours',58),
(4,1,'2026-11-02','compute_hours',60),
(5,2,'2026-11-01','storage_gb',28),
(6,2,'2026-11-02','storage_gb',30);

INSERT INTO tickets VALUES
('T-001',2,'2026-11-03T10:00:00Z','Payment failed','The card was declined when paying our past-due invoice.','new'),
('T-002',1,'2026-11-03T11:00:00Z','Invoice still open','Our payment shows pending but the invoice is open.','triaging'),
('T-003',3,'2026-11-03T12:00:00Z','Possible double charge','Two successful charges appear for the same invoice.','new'),
('T-004',1,'2026-11-04T09:00:00Z','Unexpected usage','Our compute usage increased unexpectedly.','new'),
('T-005',2,'2026-11-04T10:00:00Z','Payment extension','Can we request a payment extension?','waiting');

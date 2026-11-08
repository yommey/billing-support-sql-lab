PRAGMA foreign_keys = ON;

CREATE TABLE organizations (
    org_id INTEGER PRIMARY KEY,
    org_name TEXT NOT NULL,
    plan_name TEXT NOT NULL
);

CREATE TABLE invoices (
    invoice_id TEXT PRIMARY KEY,
    org_id INTEGER NOT NULL REFERENCES organizations(org_id),
    issued_at TEXT NOT NULL,
    due_at TEXT NOT NULL,
    amount_cents INTEGER NOT NULL CHECK (amount_cents >= 0),
    currency TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('open', 'paid', 'past_due', 'void'))
);

CREATE TABLE payments (
    payment_id TEXT PRIMARY KEY,
    invoice_id TEXT NOT NULL REFERENCES invoices(invoice_id),
    attempted_at TEXT NOT NULL,
    amount_cents INTEGER NOT NULL CHECK (amount_cents >= 0),
    status TEXT NOT NULL CHECK (status IN ('succeeded', 'failed', 'pending', 'refunded')),
    failure_category TEXT
);

CREATE TABLE usage_events (
    usage_id INTEGER PRIMARY KEY,
    org_id INTEGER NOT NULL REFERENCES organizations(org_id),
    occurred_at TEXT NOT NULL,
    resource_type TEXT NOT NULL,
    units REAL NOT NULL CHECK (units >= 0)
);

CREATE TABLE tickets (
    ticket_id TEXT PRIMARY KEY,
    org_id INTEGER NOT NULL REFERENCES organizations(org_id),
    opened_at TEXT NOT NULL,
    subject TEXT NOT NULL,
    description TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('new', 'triaging', 'waiting', 'resolved'))
);

# Billing Support SQL Lab

**An independently created, reproducible portfolio demonstration for SaaS billing support investigations.**

This repository showcases SQL investigation, support case triage, escalation playbooks and automated tests. **All customers, invoices, tickets and payment events are fictional.** It is not connected to Supabase, Stripe, an employer or any live billing system.

## Contents

- `schema.sql`: SQLite tables for organisations, invoices, payment attempts, usage and tickets.
- `seed.sql`: synthetic example records.
- `queries.sql`: queries for overdue invoices, failed/pending payments, possible duplicate payments and usage patterns.
- `triage.py`: explainable, human-reviewed ticket classification.
- `run_demo.py`: runnable demonstration.
- `tests/test_billing_lab.py`: nine unit tests.
- `SUPPORT_PLAYBOOK.md`: troubleshooting and escalation examples.

## Quick start

Python 3.10+; no third-party dependencies or API keys.

```bash
python run_demo.py
python -m unittest discover -s tests -v
```

## Example scenarios

| Fictional case | Investigation | Safe next step |
| --- | --- | --- |
| Declined payment | Invoice status, attempt time and permitted error category | Explain known status and follow approved guidance |
| Invoice still open | Distinguish pending from settled payment | Verify settlement before promising paid status |
| Suspected duplicate charge | Review multiple successful records | Escalate for reconciliation, never automatically refund |
| Unexpected usage | Compare daily usage for the billing period | Provide documented breakdown and escalate disputed metrics |

## Design principles

- No automatic refunds, retries, account suspensions or payment extensions.
- Data is synthetic and contains no personal card information.
- Rule-based classification assists a human reviewer; it does not decide financial disputes.
- Tests make the scenarios reproducible.

**Disclaimer:** This project is not affiliated with or endorsed by Supabase. The data schema is fictional and is not Supabase's internal schema.

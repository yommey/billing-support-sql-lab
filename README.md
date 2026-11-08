# Billing Support SQL Lab

[![Billing lab tests](https://github.com/yommey/billing-support-sql-lab/actions/workflows/tests.yml/badge.svg)](https://github.com/yommey/billing-support-sql-lab/actions/workflows/tests.yml)

**A reproducible, human-review-first demonstration of support investigations using SQL, Python and fictional SaaS billing records.**

This portfolio project demonstrates how I would approach failed payments, open invoices, possible duplicate charges, unexpected usage and payment-extension requests. It is **independent and synthetic**: it is not Supabase's schema, not an integration with payment processors, and not evidence of paid billing-support employment.

## Quick demo (no credentials needed)

Requirements: Python 3.10+ and the standard library.

```bash
git clone https://github.com/yommey/billing-support-sql-lab.git
cd billing-support-sql-lab
python run_demo.py
python -m unittest discover -s tests -v
```

On Windows you can use `py` in place of `python`.

**Look for:** open/past-due invoices, a possible duplicate-successful-payment flag for `INV-3001`, and triage suggestions for five sample tickets. There are **nine unit tests** for case routing and fictional data conditions. GitHub Actions also runs the tests on pushes and pull requests; inspect its badge and [workflow results](https://github.com/yommey/billing-support-sql-lab/actions) for the current status.

## What to review in two minutes

1. [SQL queries](queries.sql) — invoice status, failed attempts, pending settlement, potentially duplicated successful payment records, daily usage.
2. [Ticket triage rules](triage.py) — explainable categories, priorities and queues, including escalation of sensitive decisions.
3. [Tests](tests/test_billing_lab.py) — repeatable expected behavior, not just screenshots.
4. [Support playbook](SUPPORT_PLAYBOOK.md) — evidence-gathering, customer wording and engineering escalation.
5. [Billing knowledge notes](BILLING_SUPPORT_LEARNING_NOTES.md) — examples based on public Supabase billing documentation, clearly separated from fictional project data.
6. [Interview walkthrough](INTERVIEW_WALKTHROUGH.md) — an honest, short explanation of what was built.

## Sample support investigation

| Synthetic ticket | Evidence to check | Safe next step |
| --- | --- | --- |
| Failed payment | Invoice status, attempt timestamps, permitted failure reason | Offer approved guidance, escalate unresolved failures |
| Open invoice with pending payment | Separate pending authorization from settled payment | Verify settlement before claiming the invoice is paid |
| Two successful payment records | Compare invoice reference, amount, and attempt sequence | Flag for authorized reconciliation; **never automatically refund** |
| Unexpected resource usage | Compare usage category, period and recorded units | Explain supported breakdown, escalate disputed usage |
| Payment extension requested | Verify current invoice status and request context | Refer to authorized team; **do not promise approval** |

## Repository map

```text
schema.sql                  Fictional SQLite data model
seed.sql                    Synthetic organisations, invoices and tickets
queries.sql                 Billing investigation queries
triage.py                   Readable support triage rules
run_demo.py                 Offline end-to-end demonstration
tests/test_billing_lab.py   Nine unit tests
SUPPORT_PLAYBOOK.md         Communication and escalation examples
BILLING_SUPPORT_LEARNING_NOTES.md
INTERVIEW_WALKTHROUGH.md
.github/workflows/tests.yml Test automation on GitHub Actions
```

## Responsible design

- No card numbers, customer secrets, credentials, employer records or live API calls.
- No automated refunds, account restrictions, extensions, payment retries or dispute decisions.
- All investigation flags require a human reviewer; a duplicate payment record alone **does not establish a duplicate settled charge**.
- Designed for explanation and testability, not as production billing software.

**Independence notice:** This is a personal portfolio project and is not affiliated with or endorsed by Supabase or any payment processor.

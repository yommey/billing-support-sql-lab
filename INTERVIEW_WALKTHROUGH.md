# Three-minute technical support portfolio walkthrough

**Project status:** Independent synthetic demonstration; not a production integration.

## 0:00–0:30 — The customer problem

"Customers can report failed payments, invoices that remain open, possible duplicate charges or unexpected usage. I wanted a small reproducible environment to demonstrate how I'd investigate these issues and make a reliable handoff."

## 0:30–1:30 — Show SQL evidence

Open [queries.sql](queries.sql) and explain how joining invoices to payment attempts helps distinguish `open`, `past_due`, `pending` and `failed`. Mention that multiple successful records are a **review flag**, not proof that the bank settled two charges. Show the synthetic record `INV-3001`.

## 1:30–2:00 — Show safe triage

Open [triage.py](triage.py). Explain why duplicate-payment and dispute wording is escalated. Clarify that the software does not approve extensions, refund charges or make account changes.

## 2:00–2:30 — Show reproducibility

Run:

```bash
python run_demo.py
python -m unittest discover -s tests -v
```

Explain why predictable tests and documented data help a support engineer reproduce issues and collaborate asynchronously.

## 2:30–3:00 — Connect to past experience

"My background includes troubleshooting digital-platform transactions, documenting escalations, supporting other agents and working with SQL/data analysis. This lab is a portfolio exercise extending those transferable skills into SaaS billing scenarios—not a claim that I held a dedicated billing-engineering role."

## Honest interview answers

**Did you use real customer data?** No; all records are invented.

**Did you integrate Supabase billing or Stripe?** No; the model is fictional SQLite. Public Supabase billing documentation informs separate learning notes.

**Do you have two years in a dedicated SaaS billing-support role?** Answer based on your actual job duties and dates; do not count time spent on this project as employment experience.

**What would you improve?** Add table-driven cases, more edge conditions, independently reviewed triage thresholds, and sanitised real workflow evidence when available and authorized.

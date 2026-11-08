# Sample billing-support investigation playbook

**Fictional examples only.** Actual customer support must follow the employer's identity verification, privacy, finance, escalation and security policies.

## A. Failed payment

- Confirm organization and invoice reference through approved verification.
- Check invoice status, latest attempt and permitted failure category.
- Never request a full card number or secret authentication details.
- Offer approved troubleshooting guidance and escalate processor anomalies.

**Example customer response:** "Thanks for flagging this. The latest attempt did not complete in our sample records. I'm checking the invoice status and available failure information before recommending a next step."

## B. Open invoice with pending payment

Compare attempt and invoice statuses. Pending processing is not confirmed settlement. Escalate unexplained status mismatches with sanitized references and timestamps.

## C. Suspected double charge

Multiple successful records are an **investigation flag**, not necessarily duplicate financial settlement. Escalate reconciliation and refund decisions to authorized billing personnel; do not automatically issue refunds.

## D. Unexpected usage

Identify the billing period and usage category, compare relevant usage records, explain documented units rather than inventing rates, and escalate disputed metrics.

## Support-to-engineering escalation example

**Subject:** [Billing investigation] Open invoice with pending payment

**Customer impact:** Customer reports payment submitted but invoice remains open.

**Reproduction:** Synthetic example `INV-1002` has an open invoice and pending payment.

**Observed:** Invoice remains open while payment is pending.

**Expected:** Customer-facing language should not claim payment settled.

**Evidence:** Sanitized invoice reference, attempt time and query output.

**Requested action:** Verify expected status handling; advise next steps.

**Decision owner:** Billing engineering / authorized billing operations.

## Suggested tests

| Test | Expected safe result |
| --- | --- |
| Declined card | `failed_payment`, billing-support queue |
| Two successful payment records | High-priority flag for specialist review, no automatic refund |
| Extension request | Specialist review, no automatic approval |

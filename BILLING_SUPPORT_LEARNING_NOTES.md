# Billing Support Learning Notes — Public Supabase Documentation

**Scope:** Independent study notes prepared from public documentation to inform technical-support interview preparation. This file does **not** describe access to Supabase internal systems, customer accounts or proprietary billing procedures. Public policies can change; always check the linked documentation before advising a real customer.

## 1. Organization-based billing

Supabase documentation explains that billing is **organization-based**, with a subscription plan, payment method, billing cycle and invoices associated with each organization. Multiple projects in an organization can contribute to the organization's usage and compute costs.

**Support discovery questions:** Which organization is affected? Which billing cycle and invoice are involved? Is the issue an organization-wide subscription charge or a particular project's resource usage?

Source: [About billing on Supabase](https://supabase.com/docs/guides/platform/billing-on-supabase).

## 2. Failed payments and unpaid invoices

Supabase's monthly-invoice documentation describes automatic payment collection for the active organization payment method. It documents payment-failure notifications, retry behavior, and a manual `Pay now` option.

**Safe support workflow:** Verify the organization's invoice status and the customer's observed error; refer to the official payment-failure email and relevant billing page; do not promise a successful retry or disclose sensitive payment details. Escalate discrepancies where payment status and invoice status appear inconsistent.

Source: [Your monthly invoice](https://supabase.com/docs/guides/platform/your-monthly-invoice).

## 3. Unexpected costs and usage

Public docs distinguish fixed plan fees from variable usage, describe organization-wide quotas, and explain why multiple active projects may incur additional compute costs.

**Safe support workflow:** Confirm the organization, affected billing period, project count and relevant usage item; compare the invoice against the documented category breakdown. Avoid estimating an exact customer's bill without access to verified usage and current price information.

Sources: [Billing overview](https://supabase.com/docs/guides/platform/billing-on-supabase) and [Your monthly invoice](https://supabase.com/docs/guides/platform/your-monthly-invoice).

## 4. Spend Cap questions

Supabase's cost-control docs say that the Pro Plan's Spend Cap applies to **certain** usage categories, not all charges. Compute and some add-ons are listed as not covered.

**Safe support workflow:** Identify the specific billed usage category before saying the Spend Cap should have stopped it. Link to the current cost-control documentation rather than assuming all spending is capped.

Source: [Control your costs](https://supabase.com/docs/guides/platform/cost-control).

## 5. Research and escalation template

**Ticket:** [fictional reference only]  
**Customer-reported symptom:**  
**Affected organization / billing period (verified privately):**  
**Current documented behavior:**  
**Evidence collected without secrets:**  
**Steps to reproduce:**  
**Expected versus observed outcome:**  
**Customer-facing explanation with linked docs:**  
**Escalation owner and unresolved question:**

## What this study does not establish

- Employment or customer-billing support experience at Supabase.
- Permission to inspect or alter customer payment records.
- Knowledge of Supabase's internal billing database schema.
- Authority to grant extensions, refund charges or bypass restrictions.

This is documentation research, not legal, financial or operational guidance for real customer accounts.

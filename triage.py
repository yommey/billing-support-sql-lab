"""Human-review-first classification for fictional SaaS billing tickets.

Never approves refunds, extensions, retries, account changes or financial disputes.
"""
from dataclasses import dataclass


@dataclass(frozen=True)
class TriageResult:
    category: str
    priority: str
    queue: str
    next_step: str


def classify_ticket(subject: str, description: str) -> TriageResult:
    """Explainable, rule-based suggestions requiring human validation."""
    content = f"{subject} {description}".lower()
    if any(term in content for term in ("double charge", "duplicate charge", "two successful charges")):
        return TriageResult("possible_duplicate_payment", "high", "billing-specialist",
                            "Verify payment records; escalate for authorized reconciliation.")
    if any(term in content for term in ("dispute", "chargeback", "refund")):
        return TriageResult("billing_dispute", "high", "billing-specialist",
                            "Confirm case details and follow the approved dispute process.")
    if any(term in content for term in ("failed", "declined", "authentication_required")):
        return TriageResult("failed_payment", "medium", "billing-support",
                            "Check invoice and attempt status; share approved payment guidance.")
    if "extension" in content:
        return TriageResult("payment_extension", "medium", "billing-specialist",
                            "Escalate for decision; do not promise an extension.")
    if any(term in content for term in ("usage", "compute", "storage", "egress")):
        return TriageResult("usage_question", "normal", "usage-support",
                            "Review usage period and explain available breakdowns.")
    if any(term in content for term in ("pending", "invoice", "unpaid")):
        return TriageResult("invoice_status", "normal", "billing-support",
                            "Check whether payment settled before updating the customer.")
    return TriageResult("general", "normal", "frontline-support",
                        "Clarify the request, identify account context, and route appropriately.")

import sys
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from run_demo import make_connection
from triage import classify_ticket


class TestBillingTriage(unittest.TestCase):
    def test_failed_payment(self):
        case = classify_ticket("Payment failed", "Card declined on invoice INV-2001")
        self.assertEqual((case.category, case.queue), ("failed_payment", "billing-support"))

    def test_possible_duplicate_escalates(self):
        case = classify_ticket("Possible double charge", "Two successful charges appear")
        self.assertEqual(case.priority, "high")
        self.assertEqual(case.queue, "billing-specialist")
        self.assertIn("escalate", case.next_step.lower())

    def test_payment_extension_is_not_promised(self):
        case = classify_ticket("Payment extension", "Can I pay next week?")
        self.assertIn("do not promise", case.next_step.lower())

    def test_usage_routes_to_usage_support(self):
        self.assertEqual(classify_ticket("Usage spike", "Compute hours increased").queue, "usage-support")

    def test_unrecognized_ticket_requires_clarification(self):
        self.assertEqual(classify_ticket("General question", "Please contact me").category, "general")


class TestSyntheticBillingQueries(unittest.TestCase):
    def setUp(self):
        self.conn = make_connection()

    def tearDown(self):
        self.conn.close()

    def test_failed_payment_count(self):
        count = self.conn.execute("SELECT COUNT(*) FROM payments WHERE status = 'failed'").fetchone()[0]
        self.assertEqual(count, 2)

    def test_duplicate_successful_payment_is_flagged(self):
        rows = self.conn.execute("""
            SELECT invoice_id FROM payments WHERE status = 'succeeded'
            GROUP BY invoice_id HAVING COUNT(*) > 1
        """).fetchall()
        self.assertEqual([row[0] for row in rows], ["INV-3001"])

    def test_open_invoice_with_pending_payment(self):
        rows = self.conn.execute("""
            SELECT i.invoice_id FROM invoices i JOIN payments p ON i.invoice_id = p.invoice_id
            WHERE i.status = 'open' AND p.status = 'pending'
        """).fetchall()
        self.assertEqual([row[0] for row in rows], ["INV-1002"])

    def test_uses_no_personal_card_data(self):
        columns = [row[1] for row in self.conn.execute("PRAGMA table_info(payments)")]
        self.assertNotIn("card_number", columns)


if __name__ == "__main__":
    unittest.main()

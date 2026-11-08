"""Run an offline synthetic billing support demo with standard-library SQLite."""
from pathlib import Path
import sqlite3
from triage import classify_ticket

ROOT = Path(__file__).parent


def make_connection():
    connection = sqlite3.connect(":memory:")
    connection.row_factory = sqlite3.Row
    connection.executescript((ROOT / "schema.sql").read_text(encoding="utf-8"))
    connection.executescript((ROOT / "seed.sql").read_text(encoding="utf-8"))
    return connection


def show_query(connection, heading, query):
    print(f"\n{heading}")
    print("-" * len(heading))
    for row in connection.execute(query):
        print(" | ".join(f"{key}: {row[key]}" for key in row.keys()))


def main():
    conn = make_connection()
    show_query(conn, "Invoices to investigate", """
        SELECT invoice_id, status, amount_cents FROM invoices
        WHERE status IN ('open','past_due') ORDER BY invoice_id
    """)
    show_query(conn, "Potential duplicate successful payments (investigation only)", """
        SELECT invoice_id, COUNT(*) AS count_of_payments
        FROM payments WHERE status = 'succeeded'
        GROUP BY invoice_id HAVING COUNT(*) > 1
    """)
    print("\nTicket triage (human review required)")
    print("------------------------------------")
    for ticket in conn.execute("SELECT ticket_id, subject, description FROM tickets ORDER BY ticket_id"):
        result = classify_ticket(ticket["subject"], ticket["description"])
        print(f"{ticket['ticket_id']}: {result.category} / {result.priority} / {result.queue}")
    conn.close()


if __name__ == "__main__":
    main()

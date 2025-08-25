import sqlite3
import os
from flask import Flask, jsonify

DB_PATH = "/db/mydb.sqlite"

app = Flask(__name__)

def init_db():
    os.makedirs("/db", exist_ok=True)
    conn = sqlite3.connect(DB_PATH)
    conn.execute("CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY, name TEXT)")
    conn.close()

@app.route("/health")
def health():
    return jsonify({"status": "ok"})

if __name__ == "__main__":
    init_db()
    app.run(host="0.0.0.0", port=5000)

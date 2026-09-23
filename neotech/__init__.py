import os
from pathlib import Path

from dotenv import load_dotenv

# Load .env here too, because this file runs before settings.py
load_dotenv(Path(__file__).resolve().parent.parent / '.env')

# On the host, mysqlclient misreads MariaDB 11.4 responses
# (decimal.ConversionSyntax), so we use PyMySQL there instead.
# Enabled only when DB_DRIVER=pymysql is set in .env.
if os.environ.get('DB_DRIVER') == 'pymysql':
    import pymysql

    pymysql.version_info = (2, 2, 1, "final", 0)  # pass Django's version check
    pymysql.install_as_MySQLdb()
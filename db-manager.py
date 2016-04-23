#!/usr/bin/env python
# -*- coding: utf-8 -*-


"""
Query and modify the database.

Usage:
  db-manager.py [-i <values>] [-q <query>] [-a <arg>]
  db-manager.py -h | --help

Options:
  -i <values> Insert values in the database.
  -q <query>  Make a query.
  -a <arg>    Argument.
  -h --help   Show this screen.
"""

from docopt import docopt
import psycopg2
import psycopg2.extras
from tabulate import tabulate

def main(opts):
    q = opts['-q']
    arg = opts['-a']
    conn = psycopg2.connect("dbname=giovanni user=giovanni")
    obchord_conn = psycopg2.connect("dbname=obchord user=giovanni")
    obchord_cursor = obchord_conn.cursor()
    obchord_cursor.execute("select ob.cansmiles('c1ccccc1C(=O)NC');")
    print(obchord_cursor.fetchall())
    obchord_cursor.execute("select ob.cansmiles('C=CC(O)C');")
    print(q)
    print(q.replace('$$$',arg))
    cursor = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    try:
        cursor.execute(q)
        query_ok = True
    except psycopg2.ProgrammingError:
        cursor.execute('commit')
        query_ok = False
        print("\nQuery Error, the available tables are: \n")
        cursor.execute("select table_name from information_schema.tables where table_schema = 'chapter6'")
        for elem in cursor.fetchall():
            print('\t'+elem[0])
    # 'select * from chapter6.chemist'
#    print("\nQuery: ", q)
    if query_ok:
        table = cursor.fetchall()
        headers = ['id','name']
        import ipdb; ipdb.set_trace()
        tabulate(table, headers, tablefmt="orgtbl")

#    cursor.execute("select table_name from information_schema.tables where table_schema = 'chapter6'")
#    print (cursor.fetchall())
    conn.close()

if __name__ == '__main__':
    opts = docopt(__doc__)
    main(opts)

#!/usr/bin/env python
# -*- coding: utf-8 -*-


"""
Query and modify the database.

Usage:
  db-manager.py [-i <values>] [-q <query>] [-a <arg>]
  db-manager.py -h | --help

Example:
        $ python db-manager.py -q 'select chemist_id as "DNI", aname as "Name" from chapter6.chemist' 
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
    print("\nIgnore next lines:")
    print('c1ccccc1C(=O)NC   => ',obchord_cursor.fetchall()[0][0], " (canonical)")
#    print(obchord_cursor.fetchall())
    print("\n")
    obchord_cursor.execute("select ob.cansmiles('C=CC(O)C');")
    try:
        print(q.replace('$$$',arg))
    except:
        pass
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
    # python db-manager.py -q 'select chemist_id as "DNI", aname as "Name" from chapter6.chemist' 
    if query_ok:
        print("\nQuery: ", q)
        print("\n")
        headers = [des[0] for des in cursor.description]
        table = cursor.fetchall()
        print(tabulate(table, headers, tablefmt="orgtbl"))

    # list tables from schema
    # cursor.execute("select table_name from information_schema.tables where table_schema = 'chapter6'")
    cursor.close()
    conn.close()

if __name__ == '__main__':
    opts = docopt(__doc__)
    main(opts)

# import sock
import sqlite3
from imapclient import imap_utf7
import psycopg2.extensions
import psycopg2

try:
    conn = psycopg2.connect("dbname='tims' user='mailadm' port='5432' host='192.168.56.100' password='pgadmin80!@'")
    cur = conn.cursor()
    for users in cur.execute('select mail_user_seq, mail_uid from mail_user'):
        print(users[1])
except:
    print("NOT CONNECT")
    # print(str(users))
    # # print(e.pgerror)
    # print("I am unable to connect to the database")

conn.close()

db = sqlite3.connect("d:/_mcache.db")

folder = db.cursor()

disk_total = 0
for row in folder.execute('select * from mail_folder order by folder_name, disk_usage desc'):
    # print(row[1])
    box_name = imap_utf7.decode(str(row[1]))
    disk_usage = round(row[8]/1024/1024,3)
    if box_name not in ("Spam", "Trash", "Drafts","Quotaviolate"):
        disk_total = round( disk_total + disk_usage, 3)
    else :
        box_name = "------" + box_name + "-------"
    # print(box_name + "\t" + str(disk_usage)+"MB")

# schema = db.execute('.scheme')
# print(schema)
db.close()
# print(imap_utf7.decode("Inbox.&rLDHrMw4yHA-"))
print("DISK_USAGE : " + str(disk_total) + "MB")

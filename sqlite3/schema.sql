CREATE VIRTUAL TABLE mail_attach using fts3 (
  attach_content  text, tokenize=porter );
CREATE TABLE 'mail_attach_content'(docid INTEGER PRIMARY KEY, 'c0attach_content');
CREATE TABLE 'mail_attach_segdir'(
  level INTEGER,
  idx INTEGER,
  start_block INTEGER,
  leaves_end_block INTEGER,
  end_block INTEGER,
  root BLOB,
  PRIMARY KEY(level, idx));
CREATE TABLE 'mail_attach_segments'(blockid INTEGER PRIMARY KEY, block BLOB);
CREATE VIRTUAL TABLE mail_body using fts3 (
  body_content    text,  tokenize=porter );
CREATE TABLE 'mail_body_content'(
  docid INTEGER PRIMARY KEY, 'c0body_content');
CREATE TABLE 'mail_body_segdir'(
  level INTEGER,
  idx INTEGER,
  start_block INTEGER,
  leaves_end_block INTEGER,
  end_block INTEGER,
  root BLOB, PRIMARY KEY(level, idx));
CREATE TABLE 'mail_body_segments'(blockid INTEGER PRIMARY KEY, block BLOB);
CREATE VIRTUAL TABLE mail_body_test using fts3 (body_content text, tokenize=porter);
CREATE TABLE 'mail_body_test_content'(docid INTEGER PRIMARY KEY, 'c0body_content');
CREATE TABLE 'mail_body_test_segdir'(level INTEGER,idx INTEGER,start_block INTEGER,leaves_end_block INTEGER,end_block INTEGER,root BLOB,PRIMARY KEY(level, idx));
CREATE TABLE 'mail_body_test_segments'(blockid INTEGER PRIMARY KEY, block BLOB);
CREATE TABLE mail_folder (
  folder_no   integer primary key,
  folder_name text,
  version_no  integer,        
  uid_validity  integer,
  uid_next  integer,
  msg_count integer,
  recent_count  integer,
  unseen_count  integer,
  disk_usage  integer,
  modify_time integer  );
CREATE TABLE mail_header (
  folder_no integer,
  uid_no  integer,
  header_content  text     );
CREATE TABLE mail_message (
  folder_no integer,
  uid_no  integer,
  host_name text,
  full_path text,
  env_from  text,
  msg_flag  integer ,
  msg_size  integer,
  msg_receive integer,
  msg_date  text,
  msg_subject text,
  msg_from  text,
  msg_sender  text,
  msg_reply text,
  msg_to  text,
  msg_cc  text,
  msg_bcc text,
  msg_inreplyto text,
  msg_id  text,
  msg_priority  text,
  msg_bodystructure text,
  msg_preview text,
  msg_reference text,
  msg_integrity text,
  msg_ext1  text,
  msg_ext2  text,
  msg_ext3  text,
  msg_ext4  text,
  msg_ext5  text );
CREATE TABLE mail_message_attach  (
  messag_rowid integer,
  attach_rowid integer,
  attach_name  text );
CREATE TABLE mail_search (
  folder_no integer,
  uid_no  integer,
  msg_subject text,
  msg_from  text,
  msg_to  text,
  msg_cc  text,
  msg_received_day  integer,
  msg_sent  integer,
  msg_sent_day  integer,
  attach_name text,
  attach_count  integer,
  attach_size integer  );
CREATE TABLE mail_tag (
  tag_no  integer primary key,
  tag_name  text,
  tag_color text );
CREATE TABLE mail_tag_message (
  tag_no  integer,
  folder_no integer,
  uid_no  integer  );
CREATE TABLE table_check (
  check_no integer primary key );
CREATE TABLE user_search (
  search_no integer primary key,
  search_name text,
  search_content text);

CREATE UNIQUE INDEX i1_mail_folder on mail_folder       (folder_name);
CREATE UNIQUE INDEX i1_mail_message on mail_message (folder_no, uid_no);
CREATE UNIQUE INDEX i1_mail_search on mail_search       (folder_no, uid_no);
CREATE UNIQUE INDEX i1_mail_tag on mail_tag     (tag_name);
CREATE UNIQUE INDEX i1_mail_tag_message on mail_tag_message     (tag_no, folder_no, uid_no);
CREATE UNIQUE INDEX i1_user_search on user_search       (search_name);
CREATE INDEX i1_mail_message_attach on mail_message_attach      (messag_rowid, attach_rowid);
CREATE INDEX i1_mail_header on mail_header      (folder_no, uid_no);
CREATE INDEX i2_mail_message on mail_message (folder_no, msg_receive);
CREATE INDEX i2_mail_message_attach on mail_message_attach      (attach_rowid, messag_rowid);
CREATE INDEX i2_mail_tag_message on mail_tag_message    (folder_no, uid_no);
CREATE INDEX i3_mail_message on mail_message (full_path);
CREATE INDEX i4_mail_message on mail_message (msg_ext4);

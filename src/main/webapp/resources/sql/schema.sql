USE shopping;

DROP TABLE member;

CREATE TABLE IF NOT EXISTS member(
  member_id VARCHAR(50),
  member_pw VARCHAR(255) NOT NULL,
  member_name VARCHAR(30) NOT NULL,
  member_email VARCHAR(100) NOT NULL,
  member_addr VARCHAR(100) NOT NULL,
  member_addr_detail VARCHAR(100) NOT NULL,
  member_gb VARCHAR(3) NOT NULL COMMENT 'A001[CODE]',
  money INT NOT NULL,
  point INT NOT NULL,
  insert_date DATETIME NOT NULL DEFAULT (CURRENT_DATE),
  insert_id VARCHAR(50) NOT NULL,
  modify_date DATETIME NOT NULL DEFAULT (CURRENT_DATE),
  modify_id VARCHAR(50) NOT NULL,
  PRIMARY KEY(member_id)
);

DROP TABLE code;

CREATE TABLE IF NOT EXISTS code(
	code_id VARCHAR(4) NOT NULL,
    code varchar(4) not null,
    code_name VARCHAR(100) NOT NULL,
    code_desc VARCHAR(100),
    use_yn char(1) null,
    insert_date DATETIME NOT NULL DEFAULT (CURRENT_DATE),
	insert_id VARCHAR(20) NOT NULL,
	modify_date DATETIME NOT NULL DEFAULT (CURRENT_DATE),
	modify_id VARCHAR(20) NOT NULL
);
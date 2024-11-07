DELETE FROM code;

INSERT INTO code VALUES('A001', 'MEMBER_GB', '001 : 관리자\n002 : 구매자\n003 : 판매자', now(), 'SYSTEM', now(), 'SYSTEM');

INSERT INTO member VALUES('admin', 'admin', 'admin', 'admin', '', '', '001', '100000000', '100000000', NOW(), 'SYSTEM', NOW(), 'SYSTEM');
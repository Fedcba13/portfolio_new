DELETE FROM code;

INSERT INTO code VALUES('0000', 'A001', '멤버 구분[MEMBER_GB]', '001 : 관리자\n002 : 구매자\n003 : 판매자', '1', now(), 'SYSTEM', now(), 'SYSTEM');
INSERT INTO code VALUES('A001', '001', '관리자', '', '1', now(), 'SYSTEM', now(), 'SYSTEM');
INSERT INTO code VALUES('A001', '002', '판매자', '', '1', now(), 'SYSTEM', now(), 'SYSTEM');
INSERT INTO code VALUES('A001', '003', '구매자', '', '1', now(), 'SYSTEM', now(), 'SYSTEM');


INSERT INTO member VALUES('admin', 'admin', 'admin', 'admin', '', '', '001', '100000000', '100000000', NOW(), 'SYSTEM', NOW(), 'SYSTEM');
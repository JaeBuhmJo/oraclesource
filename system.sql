# 대소문자 구별하지 않음 (단, 비밀번호는 구별함)

# CREATE : 생성 ALTER : 수정 DROP : 삭제 DELETE : 삭제

#오라클 버전이 변경되면서 사용자 생성 시 C## 문자를 넣어서 만들도록 변경 됨
#JAVADB -> C##JAVADB / 에서 C##을 사용하지 않겠음
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE; 

# USER 생성
# CREATE USER id IDENTIFIED BY password
CREATE USER JAVADB IDENTIFIED BY 12345
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT CONNECT, RESOURCE TO JAVADB;

CREATE USER SCOTT IDENTIFIED BY TIGER
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT CONNECT, RESOURCE TO SCOTT;
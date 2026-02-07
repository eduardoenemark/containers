DROP SEQUENCE IF EXISTS domain_seq;
CREATE SEQUENCE domain_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

DROP TABLE domains IF EXISTS;
CREATE TABLE domains (
    domain_id   NUMBER PRIMARY KEY,
    domain_name VARCHAR2(100) NOT NULL,
    domain_description         VARCHAR2(50)  -- This is now the description
);

-- Insert statements with descriptions
INSERT INTO domains (domain_id, domain_name, domain_description) 
VALUES (domain_seq.nextval, 'google.com', 'Commercial');

INSERT INTO domains (domain_id, domain_name, domain_description) 
VALUES (domain_seq.nextval, 'oracle.com', 'Commercial');

INSERT INTO domains (domain_id, domain_name, domain_description) 
VALUES (domain_seq.nextval, 'amazon.com', 'Commercial');

INSERT INTO domains (domain_id, domain_name, domain_description) 
VALUES (domain_seq.nextval, 'netflix.com', 'Commercial');

INSERT INTO domains (domain_id, domain_name, domain_description) 
VALUES (domain_seq.nextval, 'spotify.com', 'Commercial');

INSERT INTO domains (domain_id, domain_name, domain_description) 
VALUES (domain_seq.nextval, 'stackoverflow.com', 'Commercial');

INSERT INTO domains (domain_id, domain_name, domain_description) 
VALUES (domain_seq.nextval, 'reddit.com', 'Commercial');

INSERT INTO domains (domain_id, domain_name, domain_description) 
VALUES (domain_seq.nextval, 'airbnb.com', 'Commercial');

INSERT INTO domains (domain_id, domain_name, domain_description) 
VALUES (domain_seq.nextval, 'github.com', 'Commercial');

INSERT INTO domains (domain_id, domain_name, domain_description) 
VALUES (domain_seq.nextval, 'dropbox.com', 'Commercial');

COMMIT;
SELECT * FROM domains;

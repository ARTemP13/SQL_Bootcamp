

CREATE SEQUENCE seq_person_discounts
    INCREMENT 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 10;

ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');
SELECT setval('seq_person_discounts', (SELECT MAX(id)+1 FROM person_discounts));


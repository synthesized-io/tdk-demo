conn test/test
--
-- TABLE ACTOR
--
CREATE OR REPLACE TRIGGER actor_before_trigger 
BEFORE INSERT ON actor FOR EACH ROW 
BEGIN
  IF (:NEW.actor_id IS NULL) THEN
    SELECT actor_sequence.nextval INTO :NEW.actor_id
    FROM DUAL;
  END IF;
  :NEW.last_update:=current_date;
END;
/

CREATE OR REPLACE TRIGGER actor_before_update
BEFORE UPDATE ON actor FOR EACH ROW 
BEGIN
  :NEW.last_update:=current_date;
END;
/

--
-- TABLE COUNTRY
--
CREATE OR REPLACE TRIGGER country_before_trigger
BEFORE INSERT ON country FOR EACH ROW 
BEGIN
  IF (:NEW.country_id IS NULL) THEN
    SELECT country_sequence.nextval INTO :NEW.country_id
    FROM DUAL;
  END IF;
  :NEW.last_update:=current_date;
END;
/

CREATE OR REPLACE TRIGGER country_before_update
BEFORE UPDATE ON country FOR EACH ROW 
BEGIN
  :NEW.last_update:=current_date;
END;
/

--
-- TABLE CITY
--
CREATE OR REPLACE TRIGGER city_before_trigger
BEFORE INSERT ON city FOR EACH ROW 
BEGIN
  IF (:NEW.city_id IS NULL) THEN
    SELECT city_sequence.nextval INTO :NEW.city_id 
    FROM DUAL;
  END IF;
 :NEW.last_update:=current_date;
END;
/

CREATE OR REPLACE TRIGGER city_before_update
BEFORE UPDATE ON city FOR EACH ROW 
BEGIN
  :NEW.last_update:=current_date;
END;
/

--
-- TABLE ADDRESS
--
CREATE OR REPLACE TRIGGER address_before_trigger
BEFORE INSERT ON address FOR EACH ROW 
BEGIN
  IF (:NEW.address_id IS NULL) THEN
    SELECT address_sequence.nextval INTO :NEW.address_id 
    FROM DUAL;
  END IF;
 :NEW.last_update:=current_date;
END;
/

CREATE OR REPLACE TRIGGER address_before_update
BEFORE UPDATE ON address FOR EACH ROW 
BEGIN
  :NEW.last_update:=current_date;
END;
/

--
-- TABLE LANGUAGE
--
CREATE OR REPLACE TRIGGER language_before_trigger
BEFORE INSERT ON language FOR EACH ROW 
BEGIN
  IF (:NEW.language_id IS NULL) THEN
    SELECT language_sequence.nextval INTO :NEW.language_id 
    FROM DUAL;
  END IF;
  :NEW.last_update:=current_date;
END;
/

CREATE OR REPLACE TRIGGER language_before_update
BEFORE UPDATE ON language FOR EACH ROW 
BEGIN
  :NEW.last_update:=current_date;
END;
/

--
-- TABLE CATEGORY
--
CREATE OR REPLACE TRIGGER category_before_trigger
BEFORE INSERT ON category FOR EACH ROW 
BEGIN
  IF (:NEW.category_id IS NULL) THEN
    SELECT category_sequence.nextval INTO :NEW.category_id 
    FROM DUAL;
  END IF;
  :NEW.last_update:=current_date;
END;
/

CREATE OR REPLACE TRIGGER category_before_update
BEFORE UPDATE ON category FOR EACH ROW 
BEGIN
  :NEW.last_update:=current_date;
END;
/

--
-- TABLE CUSTOMER
--
CREATE OR REPLACE TRIGGER customer_before_trigger
BEFORE INSERT ON customer FOR EACH ROW 
BEGIN
  IF (:NEW.customer_id IS NULL) THEN
    SELECT customer_sequence.nextval INTO :NEW.customer_id 
    FROM DUAL;
  END IF;
  :NEW.last_update:=current_date;
  :NEW.create_date:=current_date;
END;
/
CREATE OR REPLACE TRIGGER customer_before_update
BEFORE UPDATE ON customer FOR EACH ROW 
BEGIN
  :NEW.last_update:=current_date;
END;
/

--
-- TABLE FILM
--
CREATE OR REPLACE TRIGGER film_before_trigger
BEFORE INSERT ON film FOR EACH ROW 
BEGIN
 IF (:NEW.film_id IS NULL) THEN
   SELECT film_sequence.nextval INTO :NEW.film_id 
    FROM DUAL;
  END IF;
  :NEW.last_update:=current_date;
END;
/

CREATE OR REPLACE TRIGGER film_before_update
BEFORE UPDATE ON film FOR EACH ROW 
BEGIN
  :NEW.last_update:=current_date;
END;
/

--
-- TABLE FILM_ACTOR
--
CREATE OR REPLACE TRIGGER film_actor_before_trigger
BEFORE INSERT ON film_actor FOR EACH ROW 
BEGIN
    :NEW.last_update:=current_date;
END;
/

CREATE OR REPLACE TRIGGER film_actor_before_update
BEFORE UPDATE ON film_actor FOR EACH ROW 
BEGIN
  :NEW.last_update:=current_date;
END;
/

--
-- TABLE FILM_CATEGORY
--
CREATE OR REPLACE TRIGGER film_category_before_trigger
BEFORE INSERT ON film_category FOR EACH ROW 
BEGIN
    :NEW.last_update:=current_date;
END;
/

CREATE OR REPLACE TRIGGER film_category_before_update
BEFORE UPDATE ON film_category FOR EACH ROW 
BEGIN
  :NEW.last_update:=current_date;
END;
/

--
-- TABLE INVENTORY
--
CREATE OR REPLACE TRIGGER inventory_before_trigger
BEFORE INSERT ON inventory FOR EACH ROW 
BEGIN
 IF (:NEW.inventory_id IS NULL) THEN
   SELECT inventory_sequence.nextval INTO :NEW.inventory_id 
    FROM DUAL;
  END IF;
  :NEW.last_update:=current_date;
END;
/
CREATE OR REPLACE TRIGGER inventory_before_update
BEFORE UPDATE ON inventory FOR EACH ROW 
BEGIN
  :NEW.last_update:=current_date;
END;
/

--
-- TABLE STAFF
--
CREATE OR REPLACE TRIGGER staff_before_trigger
BEFORE INSERT ON staff FOR EACH ROW 
BEGIN
 IF (:NEW.staff_id IS NULL) THEN
   SELECT staff_sequence.nextval INTO :NEW.staff_id 
    FROM DUAL;
  END IF;
  :NEW.last_update:=current_date;
END;
/

CREATE OR REPLACE TRIGGER staff_before_update
BEFORE UPDATE ON staff FOR EACH ROW 
BEGIN
  :NEW.last_update:=current_date;
END;
/

--
-- TABLE STORE
--
CREATE OR REPLACE TRIGGER store_before_trigger
BEFORE INSERT ON store FOR EACH ROW 
BEGIN
 IF (:NEW.store_id IS NULL) THEN
   SELECT store_sequence.nextval INTO :NEW.store_id 
    FROM DUAL;
  END IF;
 :NEW.last_update:=current_date;
END;
/

CREATE OR REPLACE TRIGGER store_before_update
BEFORE UPDATE ON store FOR EACH ROW 
BEGIN
  :NEW.last_update:=current_date;
END;
/

--
-- TABLE PAYMENT
--
CREATE OR REPLACE TRIGGER payment_before_trigger
BEFORE INSERT ON payment FOR EACH ROW 
BEGIN
 IF (:NEW.payment_id IS NULL) THEN
   SELECT payment_sequence.nextval INTO :NEW.payment_id  
    FROM DUAL;
  END IF;
 :NEW.last_update:=current_date;
END;
/

CREATE OR REPLACE TRIGGER payment_before_update
BEFORE UPDATE ON payment FOR EACH ROW 
BEGIN
  :NEW.last_update:=current_date;
END;
/

--
-- TABLE RENTAL
--
CREATE OR REPLACE TRIGGER rental_before_trigger
BEFORE INSERT ON rental FOR EACH ROW 
BEGIN
 IF (:NEW.rental_id IS NULL) THEN
   SELECT rental_sequence.nextval INTO :NEW.rental_id 
    FROM DUAL;
  END IF;
 :NEW.last_update:=current_date;
END;
/

CREATE OR REPLACE TRIGGER rental_before_update
BEFORE UPDATE ON rental FOR EACH ROW 
BEGIN
  :NEW.last_update:=current_date;
END;
/

DECLARE
    c_nyelv  item_lang.nyelv%rowtype;
	c_id  item.id%rowtype;
    CURSOR c IS SELECT i.id,i.userid,i.userid,i.time,l.cim,l.bev,l.nyelv
FROM item i
LEFT OUTER JOIN item_lang l ON i.id = l.itemid;
   
BEGIN
    OPEN c ;
    LOOP
        FETCH c INTO c_nyelv,c_id ;
        EXIT WHEN c%notfound;
       
       IF c_nyelv = 'en' THEN
            UPDATE c SET cim = 'nyelnyelvnyelv';
			DELETE FROM tutorials_tbl WHERE tutorial_id=3;
   
    END LOOP;
    CLOSE c;
	 SELECT * FROM c;
END;


DECLARE
    CURSOR c IS SELECT *FROM item ;

   
BEGIN
    OPEN c FOR;
    LOOP
    CLOSE c;
	 SELECT * FROM c;
END;

--getdata9 regi--------------------------

BEGIN
   SET @s = CONCAT(" CURSOR c IS SELECT i.id,i.userid,i.userid,i.time,l.cim,l.bev,l.nyelv
FROM item i
LEFT OUTER JOIN item_lang l ON i.id = l.itemid WHERE l.nyelv='",lng,"'" ,szukit);
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt; 
  END




















--1.
DECLARE
    a    NUMBER := 1; --TODO
    i    NUMBER := 1; --ciklusvaltozo
BEGIN
    FOR i IN 1..10 LOOP
        dbms_output.put_line(to_char(a));
        a := 5 * a + 2;
    END LOOP;
END;
/

--2.
DECLARE
    c_fizu    Dolgozo.fizu%type;
    c_varos    Dolgozo.varos%type;
    emeles    NUMBER;
    s        NUMBER := 0;
    db        NUMBER := 0;
    CURSOR c IS
        SELECT fizu, varos
        FROM Dolgozo
        WHERE varos IN ('Miskolc', 'Eger');
BEGIN
    OPEN c;
    LOOP
        FETCH c INTO c_fizu, c_varos;
        EXIT WHEN c%notfound;
       
        emeles := 0;
       
        IF c_varos = 'Miskolc' THEN
            emeles := c_fizu * 0.1;
        ELSIF db > 0
            emeles := c_fizu * ((s / db) * 0.2);
        END IF;
       
        IF emeles > 0 THEN
            c_fizu := c_fizu + emeles;
            s := s + c_fizu;
            db := db + 1;
            UPDATE Dolgozo SET fizu = c_fizu WHERE current of c;
        END IF;
    END LOOP;
    CLOSE c;
END;
/
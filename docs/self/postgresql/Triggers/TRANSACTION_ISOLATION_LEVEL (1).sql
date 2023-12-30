\echo 'Before executing DROP TRIGGER statement'
SELECT '\n' AS " "; -- Adding new line

\dS Product
SELECT '\n' AS " "; -- Adding new line

DROP TRIGGER product_insert_trg ON Product;

\echo 'After executing DROP TRIGGER statement'
SELECT '\n' AS " "; -- Adding new line

\dS Product
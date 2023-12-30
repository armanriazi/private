
SELECT 
  '{"street": "123 Main St", "city": "New York", "state": "NY"}'::jsonb 
  AS "Address";

SELECT '\n' AS " "; -- Adding new line

SELECT 
  '{"street": "123 Main St", "city": "New York", "state": "NY"}'::jsonb 
  @> '{"state": "NY"}'::jsonb AS "Is NY state?";

SELECT '\n' AS " "; -- Adding new line

SELECT 
  '{"state": "WA"}'::jsonb <@
  '{"street": "123 Main St", "city": "New York", "state": "NY"}'::jsonb 
AS "Is WA state?";


SELECT '\n' AS " "; -- Adding new line

SELECT 
  '{"street": "123 Main St", "city": "New York", "state": "NY"}'::jsonb 
  ? 'city' 
AS "contains key city?";

SELECT '\n' AS " "; -- Adding new line

SELECT 
  '{"street": "123 Main St", "city": "New York", "state": "NY"}'::jsonb 
  ?& array['street', 'city', 'state'] 
AS "contains ALL address fields?";

SELECT '\n' AS " "; -- Adding new line

SELECT 
  '{"street": "123 Main St", "city": "New York", "state": "NY"}'::jsonb 
  ?| array['street', 'city', 'state', 'zipcode'] 
AS "contains ANY address fields";

SELECT '\n' AS " "; -- Adding new line

SELECT 
  '{"street": "123 Main St", "city": "New York", "state": "NY"}'::jsonb
  || '{"zipcode": "A2N9ZJ"}'::jsonb AS "address with zipcode";

SELECT '\n' AS " "; -- Adding new line

SELECT 
  '{"street": "123 Main St", "city": "New York", "state": "NY"}'::jsonb
  - 'state' AS  "address without state";

SELECT '\n' AS " "; -- Adding new line

SELECT 
  '["Jane", "John"]'::jsonb - 1 
  AS "removing item at index 1 from the list";

SELECT 
  '["Jane", {"Mary":1, "Steve":2}]'::jsonb #- '{1, "Steve"}' 
  AS "removing item at specified path";
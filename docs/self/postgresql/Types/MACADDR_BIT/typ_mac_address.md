```sql
CREATE TABLE Users (
  user_id SERIAL PRIMARY KEY,
  user_name VARCHAR(255),
  user_ip_address INET,
  user_mac_address MACADDR,
  user_location VARCHAR(255),
  user_status BIT
);
```

```sql
INSERT INTO
  Users (
    user_name,
    user_ip_address,
    user_mac_address,
    user_location, 
    user_status
  )
VALUES
  (
    'John Doe',
    '192.168.0.1',
    '00:11:22:33:44:55',
    'California', 
    B'1'
  ),
  (
    'Jane Smith',
    '10.0.0.1',
    '01:02:03:04:05:06',
    'New York',
    B'0'
  );

SELECT * FROM users;
```
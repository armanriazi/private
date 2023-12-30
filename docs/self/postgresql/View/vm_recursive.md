-- One example of where a recursive view can be useful is in querying an organizational hierarchy. Here, the query can show the hierarchical relationship between employees and their managers by referencing the view within itself.
-- The view created above can be used to find all the employees and their respective managers in the company hierarchy. This view can then be queried to find the manager of a specific employee or to show the entire company hierarchy. 
CREATE RECURSIVE VIEW Org_chart(id, mgr_id, name, level) as (
  SELECT
    id, mgr_id, name, 1
  FROM
    employee
  WHERE
    mgr_id IS NULL
  UNION ALL
  SELECT
    e.id, e.mgr_id, e.name, level + 1
  FROM
    employee e INNER JOIN Org_chart o 
    ON o.id = e.mgr_id
);

SELECT * FROM Org_chart;
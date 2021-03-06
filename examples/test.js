import {tmpl} from '@mojojs/template';
import Pg, {sql} from '@mojojs/pg';

const template = tmpl`
<html>
  <head>
    <title><%= title %></title>
  </head>
  <body>
    %== content
  </body>
</html>
`;

const pg = new Pg('postgres://user:password@localhost:5432/database');

const one = await pg.query`SELECT ${1}`;

const role = 'admin';
const partialQuery = pg.sql`AND role = ${role}`;
const name = 'root';
const two = pg.query`SELECT * FROM users WHERE name = ${name} ${partialQuery}`;

const db = await pg.db();
const three = await db.query`SELECT 2`;
const four = await db.query`SELECT 3`;
db.release();

const query = sql`
SELECT EXTRACT(EPOCH FROM ts) AS epoch, COALESCE(failed_jobs, 0) AS failed_jobs,
  COALESCE(finished_jobs, 0) AS finished_jobs
FROM (
  SELECT EXTRACT (DAY FROM finished) AS day, EXTRACT(HOUR FROM finished) AS hour,
    COUNT(*) FILTER (WHERE state = 'failed') AS failed_jobs,
    COUNT(*) FILTER (WHERE state = 'finished') AS finished_jobs
  FROM minion_jobs
  WHERE finished > NOW() - INTERVAL '23 hours'
  GROUP BY day, hour
) AS j RIGHT OUTER JOIN (
  SELECT *
  FROM GENERATE_SERIES(NOW() - INTERVAL '23 hour', NOW(), '1 hour') AS ts
) AS s ON EXTRACT(HOUR FROM ts) = j.hour AND EXTRACT(DAY FROM ts) = j.day
ORDER BY epoch ASC
`;

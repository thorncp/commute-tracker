WITH
zone_converted AS (
  SELECT
    commutes.user_id,
    (commutes.departed_at AT TIME ZONE 'UTC')
      AT TIME ZONE users.timezone departed_at,
    (commutes.arrived_at AT TIME ZONE 'UTC')
      AT TIME ZONE users.timezone arrived_at
  FROM
    commutes
    INNER JOIN users
      ON users.id = commutes.user_id
)
SELECT
  user_id,
  CAST(EXTRACT(DOW FROM departed_at) AS INTEGER) day_of_week,
  EXTRACT(EPOCH FROM AVG(arrived_at - departed_at) / 60) duration,
  COUNT(*) count
FROM
  zone_converted
GROUP BY
  day_of_week,
  user_id

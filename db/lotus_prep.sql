-- Rails and Lotus use the same table name for migrations, but the details are a
-- little different. Rails uses a 'version' column, while Lotus uses 'filename'.
-- This change destroys the Rails table and replaces it with one suitable for
-- Lotus.

-- The '20151126062925_bootstrap.rb' filename is inserted into the migrations
-- table, which will prevent it from being executed on production. This file is
-- intended to bring a new development setup to parity with the legacy schema.
-- This script will be executed manually, exactly once, if everything goes
-- according to plan >.<

DROP TABLE schema_migrations;

CREATE TABLE schema_migrations (
  filename TEXT PRIMARY KEY
);

INSERT INTO schema_migrations VALUES ('20151126062925_bootstrap.rb');

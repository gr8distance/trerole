
-- +migrate Up
CREATE TABLE IF NOT EXISTS users (
  id varchar(255),
  name varchar(255),
  inserted_at timestamp(0) NOT NULL,
  updated_at timestamp(0) NOT NULL,
  PRIMARY KEY ("id")
);

-- +migrate Down
DROP TABLE IF EXISTS users;

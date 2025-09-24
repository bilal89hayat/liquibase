--liquibase formatted sql

--changeset bilal:1
CREATE TABLE users (
    id BIGINT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

--changeset bilal:2
ALTER TABLE users ADD COLUMN created_at TIMESTAMP DEFAULT NOW();

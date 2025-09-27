--liquibase formatted sql

--changeset bilal:2
ALTER TABLE users ADD COLUMN created_at TIMESTAMP DEFAULT NOW();
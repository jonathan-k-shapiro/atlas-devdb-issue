CREATE DOMAIN verification_status AS TEXT CHECK (VALUE IN ('verified', 'unverified'));
CREATE TABLE users (
    id BIGINT GENERATED ALWAYS AS IDENTITY,
    firstname TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    verification_status verification_status NOT NULL DEFAULT 'unverified'
);

-- Create domain type "verification_status"
CREATE DOMAIN "myschema"."verification_status" AS text CONSTRAINT "verification_status_check" CHECK (VALUE = ANY (ARRAY['verified'::text, 'unverified'::text]));
-- Modify "users" table
ALTER TABLE "myschema"."users" ADD COLUMN "verification_status" "myschema"."verification_status" NOT NULL DEFAULT 'unverified'::text;

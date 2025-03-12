-- Create domain type "verification_status"
CREATE DOMAIN "public"."verification_status" AS text CONSTRAINT "verification_status_check" CHECK (VALUE = ANY (ARRAY['verified'::text, 'unverified'::text]));
-- Modify "users" table
ALTER TABLE "public"."users" ADD COLUMN "verification_status" "public"."verification_status" NOT NULL DEFAULT 'unverified'::text;

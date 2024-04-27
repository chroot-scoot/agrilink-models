CREATE TABLE IF NOT EXISTS "community_post_comments" (
	"comment_id" uuid PRIMARY KEY NOT NULL,
	"post" uuid,
	"original_poster" uuid,
	"post_rating" integer,
	"comment_content" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "community_post" (
	"post_id" uuid PRIMARY KEY NOT NULL,
	"original_poster" uuid,
	"number_comments" integer,
	"post_rating" integer,
	"post_content" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "product_images" (
	"product_img_id" uuid PRIMARY KEY NOT NULL,
	"product_id" uuid,
	"product_image_file" varchar NOT NULL,
	"product_image_description" varchar(50),
	"product_image_url" varchar NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "product_reviews" (
	"product_review_id" uuid PRIMARY KEY NOT NULL,
	"product_id" uuid,
	"product_reviewer" varchar NOT NULL,
	"product_review_content" varchar(250),
	"given_product_rating" smallint NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "product_profiles" (
	"product_id" uuid PRIMARY KEY NOT NULL,
	"product_name" varchar NOT NULL,
	"about_product" varchar(50),
	"store_id" uuid,
	"product_price" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "store_images" (
	"store_img_id" uuid PRIMARY KEY NOT NULL,
	"store_id" uuid,
	"store_image_file" varchar NOT NULL,
	"store_image_description" varchar(50),
	"store_image_url" varchar NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "store_reviews" (
	"store_review_id" uuid PRIMARY KEY NOT NULL,
	"store_id" uuid,
	"store_reviewer" varchar NOT NULL,
	"store_review_content" varchar(250),
	"given_store_rating" smallint NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "store_profile" (
	"store_id" uuid PRIMARY KEY NOT NULL,
	"store_name" varchar NOT NULL,
	"about_store" varchar(250),
	"store_location_city" varchar NOT NULL,
	"store_location_state" varchar NOT NULL,
	"store_contact_number" char(10),
	"store_contact_email" varchar,
	CONSTRAINT "store_profile_store_contact_number_unique" UNIQUE("store_contact_number"),
	CONSTRAINT "store_profile_store_contact_email_unique" UNIQUE("store_contact_email")
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "community_post_comments" ADD CONSTRAINT "community_post_comments_post_community_post_post_id_fk" FOREIGN KEY ("post") REFERENCES "community_post"("post_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "community_post_comments" ADD CONSTRAINT "community_post_comments_original_poster_store_profile_store_id_fk" FOREIGN KEY ("original_poster") REFERENCES "store_profile"("store_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "community_post" ADD CONSTRAINT "community_post_original_poster_store_profile_store_id_fk" FOREIGN KEY ("original_poster") REFERENCES "store_profile"("store_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "product_images" ADD CONSTRAINT "product_images_product_id_product_profiles_product_id_fk" FOREIGN KEY ("product_id") REFERENCES "product_profiles"("product_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "product_reviews" ADD CONSTRAINT "product_reviews_product_id_product_profiles_product_id_fk" FOREIGN KEY ("product_id") REFERENCES "product_profiles"("product_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "product_profiles" ADD CONSTRAINT "product_profiles_store_id_store_profile_store_id_fk" FOREIGN KEY ("store_id") REFERENCES "store_profile"("store_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "store_images" ADD CONSTRAINT "store_images_store_id_store_profile_store_id_fk" FOREIGN KEY ("store_id") REFERENCES "store_profile"("store_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "store_reviews" ADD CONSTRAINT "store_reviews_store_id_store_profile_store_id_fk" FOREIGN KEY ("store_id") REFERENCES "store_profile"("store_id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

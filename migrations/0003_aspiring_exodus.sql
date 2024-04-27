ALTER TABLE "community_post_comments" ALTER COLUMN "post_rating" SET DEFAULT 0;--> statement-breakpoint
ALTER TABLE "community_post" ALTER COLUMN "post_rating" SET DEFAULT 0;--> statement-breakpoint
ALTER TABLE "product_profiles" ADD COLUMN "store_rating" numeric DEFAULT '0.0';--> statement-breakpoint
ALTER TABLE "store_profile" ADD COLUMN "store_rating" numeric DEFAULT '0.0';
ALTER TABLE "community_post_comments" ALTER COLUMN "comment_id" SET DEFAULT gen_random_uuid();--> statement-breakpoint
ALTER TABLE "community_post" ALTER COLUMN "post_id" SET DEFAULT gen_random_uuid();--> statement-breakpoint
ALTER TABLE "product_images" ALTER COLUMN "product_img_id" SET DEFAULT gen_random_uuid();--> statement-breakpoint
ALTER TABLE "product_reviews" ALTER COLUMN "product_review_id" SET DEFAULT gen_random_uuid();--> statement-breakpoint
ALTER TABLE "product_profiles" ALTER COLUMN "product_id" SET DEFAULT gen_random_uuid();--> statement-breakpoint
ALTER TABLE "store_images" ALTER COLUMN "store_img_id" SET DEFAULT gen_random_uuid();--> statement-breakpoint
ALTER TABLE "store_reviews" ALTER COLUMN "store_review_id" SET DEFAULT gen_random_uuid();--> statement-breakpoint
ALTER TABLE "store_profile" ALTER COLUMN "store_id" SET DEFAULT gen_random_uuid();--> statement-breakpoint
ALTER TABLE "community_post_comments" ADD COLUMN "created_at" time DEFAULT now();--> statement-breakpoint
ALTER TABLE "community_post" ADD COLUMN "created_at" time DEFAULT now();--> statement-breakpoint
ALTER TABLE "product_profiles" ADD COLUMN "product_inventory" numeric;--> statement-breakpoint
ALTER TABLE "product_profiles" ADD COLUMN "inventory_unit" varchar;
import { pgTable, uuid, varchar, smallint } from "drizzle-orm/pg-core";
import { products } from "./product";

export const storeReviews = pgTable("product_reviews", {
  review_id: uuid("product_review_id").primaryKey(),
  product: uuid("product_id").references(() => products.id, {
    onDelete: "cascade",
  }),
  reviewer: varchar("product_reviewer").notNull(),
  content: varchar("product_review_content", { length: 250 }),
  rating: smallint("given_product_rating").notNull(),
});
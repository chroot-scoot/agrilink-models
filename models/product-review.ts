import { pgTable, uuid, varchar, smallint } from "drizzle-orm/pg-core";
import { products } from "./product.js";

export const productReviews = pgTable("product_reviews", {
  review_id: uuid("product_review_id").primaryKey().defaultRandom(),
  product: uuid("product_id").references(() => products.id, {
    onDelete: "cascade",
  }),
  reviewer: varchar("product_reviewer").notNull(),
  content: varchar("product_review_content", { length: 250 }),
  rating: smallint("given_product_rating").notNull(),
});

import { pgTable, uuid, varchar, smallint } from "drizzle-orm/pg-core";
import { store } from "./stores.js";

export const storeReviews = pgTable("store_reviews", {
  review_id: uuid("store_review_id").primaryKey().defaultRandom(),
  store: uuid("store_id").references(() => store.id, { onDelete: "cascade" }),
  reviewer: varchar("store_reviewer").notNull(),
  content: varchar("store_review_content", { length: 250 }),
  rating: smallint("given_store_rating").notNull(),
});

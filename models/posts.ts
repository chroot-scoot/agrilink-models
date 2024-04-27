import { integer, pgTable, uuid, text, time } from "drizzle-orm/pg-core";
import { store } from "./stores";

export const post = pgTable("community_post", {
  id: uuid("post_id").primaryKey().defaultRandom(),
  author: uuid("original_poster").references(() => store.id),
  comments: integer("number_comments"),
  rating: integer("post_rating").default(0),
  content: text("post_content"),
  created_at: time("created_at").defaultNow(),
});

import { integer, pgTable, uuid, text } from "drizzle-orm/pg-core";
import { store } from "./stores";

export const post = pgTable("community_post", {
  id: uuid("post_id").primaryKey(),
  author: uuid("original_poster").references(() => store.id),
  comments: integer("number_comments"),
  rating: integer("post_rating"),
  content: text("post_content"),
});

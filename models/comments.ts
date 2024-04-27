import { integer, pgTable, uuid, text, time } from "drizzle-orm/pg-core";
import { store } from "./stores";
import { post } from "./posts";

export const comment = pgTable("community_post_comments", {
  id: uuid("comment_id").primaryKey().defaultRandom(),
  post: uuid("post").references(() => post.id, { onDelete: "cascade" }),
  author: uuid("original_poster").references(() => store.id),
  rating: integer("post_rating"),
  content: text("comment_content"),
  created_at: time("created_at").defaultNow(),
});

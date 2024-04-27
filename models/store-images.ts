import { pgTable, uuid, varchar } from "drizzle-orm/pg-core";
import { store } from "./stores.js";

export const storeImages = pgTable("store_images", {
  id: uuid("store_img_id").primaryKey().defaultRandom(),
  store: uuid("store_id").references(() => store.id, { onDelete: "cascade" }),
  filename: varchar("store_image_file").notNull(),
  about: varchar("store_image_description", { length: 50 }),
  url: varchar("store_image_url").notNull(),
});

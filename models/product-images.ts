import { pgTable, uuid, varchar } from "drizzle-orm/pg-core";
import { products } from "./product.js";

export const productImages = pgTable("product_images", {
  id: uuid("product_img_id").primaryKey().defaultRandom(),
  product: uuid("product_id").references(() => products.id, {
    onDelete: "cascade",
  }),
  filename: varchar("product_image_file").notNull(),
  about: varchar("product_image_description", { length: 50 }),
  url: varchar("product_image_url").notNull(),
});

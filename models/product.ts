import {
  pgTable,
  uuid,
  varchar,
  char,
  integer,
  decimal,
} from "drizzle-orm/pg-core";
import { store } from "./stores";

export const products = pgTable("product_profiles", {
  id: uuid("product_id").primaryKey().defaultRandom(),
  name: varchar("product_name").notNull(),
  about: varchar("about_product", { length: 50 }),
  store: uuid("store_id").references(() => store.id, { onDelete: "cascade" }),
  price: integer("product_price").notNull(),
  inventory: decimal("product_inventory"),
  unit: varchar("inventory_unit"),
});

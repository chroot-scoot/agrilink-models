import {
  pgTable,
  uuid,
  varchar,
  integer,
  decimal,
  boolean,
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
  isOrganic: boolean("is_organic").default(false),
  isSeasonal: boolean("is_seasonal").default(false),
  rating: decimal("store_rating").default("0.0"),
});

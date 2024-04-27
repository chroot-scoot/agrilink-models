import { pgTable, uuid, varchar, char } from "drizzle-orm/pg-core";

export const store = pgTable("store_profile", {
  id: uuid("store_id").primaryKey().defaultRandom(),
  name: varchar("store_name").notNull(),
  about: varchar("about_store", { length: 250 }),
  location_city: varchar("store_location_city").notNull(),
  location_state: varchar("store_location_state").notNull(),
  contact_number: char("store_contact_number", { length: 10 }).unique(),
  contact_email: varchar("store_contact_email").unique(),
});

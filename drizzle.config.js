/** @type { import("drizzle-kit").Config } */
const config = {
  schema: "./models",
  out: "./migrations",
  driver: "pg",
  dbCredentials: {
    connectionString: process.env.DB_URL,
  },
};

export default config;

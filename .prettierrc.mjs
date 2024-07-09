/** @type {import("prettier").Config} */
const prettierConfig = {
  tabWidth: 2,
  useTabs: false,
  trailingComma: "es5",
  semi: false,
  singleQuote: false,
  plugins: ["@typespec/prettier-plugin-typespec"],
  overrides: [{ files: "*.tsp", options: { parser: "typespec" } }],
}

export default prettierConfig

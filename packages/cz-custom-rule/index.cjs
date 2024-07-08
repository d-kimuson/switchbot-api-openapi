// @ts-check
const engine = require("cz-conventional-changelog/engine")

/** @typedef {{ title: string, description: string, emoji?: string } } CommitType */

// ref: https://github.com/pvdlg/conventional-commit-types/blob/master/index.js#L93
/** @type {{ [K: string]: CommitType }} */
const commitTypes = {
  feat: {
    description: "A new feature",
    title: "Features",
    emoji: "✨",
  },
  fix: {
    description: "A bug fix",
    title: "Bug Fixes",
    emoji: "🐛",
  },
  docs: {
    description: "Documentation only changes",
    title: "Documentation",
    emoji: "📚",
  },
  style: {
    description:
      "Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)",
    title: "Styles",
    emoji: "💎",
  },
  refactor: {
    description: "A code change that neither fixes a bug nor adds a feature",
    title: "Code Refactoring",
    emoji: "📦",
  },
  perf: {
    description: "A code change that improves performance",
    title: "Performance Improvements",
    emoji: "🚀",
  },
  test: {
    description: "Adding missing tests or correcting existing tests",
    title: "Tests",
    emoji: "🚨",
  },
  build: {
    description:
      "Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)",
    title: "Builds",
    emoji: "🛠",
  },
  ci: {
    description:
      "Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)",
    title: "Continuous Integrations",
    emoji: "⚙️",
  },
  chore: {
    description: "Other changes that don't modify src or test files",
    title: "Chores",
    emoji: "♻️",
  },
  revert: {
    description: "Reverts a previous commit",
    title: "Reverts",
    emoji: "🗑",
  },
}

module.exports = engine({
  types: commitTypes,
  // config

  defaultType: undefined,
  defaultScope: undefined,
  defaultSubject: undefined,
  defaultBody: undefined,
  defaultIssues: undefined,
  disableScopeLowerCase: undefined,
  disableSubjectLowerCase: undefined,
  maxHeaderWidth: 100,
  maxLineWidth: 100,
})

#!/usr/bin/env node

const fs = require("fs");
const path = require("path");
const { evaluator } = require("./grammar/evaluator");
const program = require("commander");
const VERSION = require("../package.json").version;

let fileValue;

program
  .name("interprete-sencillo-jison")
  .version(VERSION, "    --version")
  .usage("[options] [dir]")
  .arguments("<file>")
  .action(file => {
    fileValue = file;
  })
  .parse(process.argv);

if (typeof fileValue === "undefined") {
  console.error("Error: no file given.");
  process.exit(1);
}

const input = fs.readFileSync(path.normalize(fileValue), "utf8");
evaluator.exec(input);

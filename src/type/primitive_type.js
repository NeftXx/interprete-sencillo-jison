"use strict";

const Type = require("./type");

class PrimitiveType extends Type {}

const NUMBER = new PrimitiveType("number");
const STRING = new PrimitiveType("string");
const BOOLEAN = new PrimitiveType("boolean");

module.exports = {
  NUMBER,
  STRING,
  BOOLEAN
};

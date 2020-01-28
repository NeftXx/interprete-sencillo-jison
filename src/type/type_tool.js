"use strict";

const PrimitiveType = require("./primitive_type");
const EmptyType = require("./empty_type");

module.exports = class TypeTool {
  static getTypeUndefined() {
    return EmptyType.UNDEFINED;
  }

  static getTypeNumber() {
    return PrimitiveType.NUMBER;
  }

  static getTypeString() {
    return PrimitiveType.STRING;
  }

  static getTypeBoolean() {
    return PrimitiveType.BOOLEAN;
  }

  static isTypeUndefined(type) {
    return type === PrimitiveType.UNDEFINED;
  }

  static isTypeNumber(type) {
    return type === PrimitiveType.NUMBER;
  }

  static isTypeString(type) {
    return type === PrimitiveType.STRING;
  }

  static isTypeBoolean(type) {
    return type === PrimitiveType.BOOLEAN;
  }
};

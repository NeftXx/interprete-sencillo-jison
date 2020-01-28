"use strict";
const Expression = require("../expression");

module.exports = class Operation extends Expression {
  constructor(location, leftExp, rightExp) {
    super(location);
    this.leftExp = leftExp;
    this.rightExp = rightExp;
  }
};

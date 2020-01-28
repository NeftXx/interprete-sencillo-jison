"use strict";
const Operation = require("./operation");

module.exports = class Arithmetic extends Operation {
  /**
   *
   * @param {Location} location
   * @param {Expression} leftExp
   * @param {string} operator
   * @param {Expression} rightExp
   */
  constructor(location, leftExp, operator, rightExp) {
    super(location, leftExp, rightExp);
    this.operator = operator;
  }

  interpret(scope) {
    switch (this.operator) {
      case "+":
        break;
      case "-":
        break;
      case "*":
        break;
      case "/":
        break;
      case "%":
        break;
    }
  }
};

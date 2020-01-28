const { parse } = require("./grammar");

class Evaluator {
  /**
   * method that parses an input
   *
   * @param {string} input to analyze
   */
  exec(input) {
    try {
      parse(input);
    } catch (error) {}
  }
}

module.exports.evaluator = new Evaluator();

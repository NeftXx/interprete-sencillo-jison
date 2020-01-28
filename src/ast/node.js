"use strict";

module.exports = class Node {
  /**
   *
   * @param {Location} location
   */
  constructor(location) {
    this.location = location;
  }

  /**
   *
   * @param {Scope} scope
   */
  interpret(scope) {
    throw new Error("You have to implement the method doSomething!");
  }
};

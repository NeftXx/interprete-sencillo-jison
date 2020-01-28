"use strict";
const Node = require("../node");
const TypeTool = require("../../type/type_tool");

module.exports = class Expression extends Node {
  constructor(location) {
    super(location);
    this.value = null;
    this.type = TypeTool.getTypeUndefined();
  }
};

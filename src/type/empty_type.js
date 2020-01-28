"use strict";

const Type = require("../type/type");

class EmptyType extends Type {}

const UNDEFINED = new EmptyType("undefined");

module.exports = { UNDEFINED };

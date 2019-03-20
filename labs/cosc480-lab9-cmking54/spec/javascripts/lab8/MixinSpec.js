describe("mixin tests", function() {
  var meths = {
    "setter": function(value) { this._mixin_val = value; },
    "getter": function() { return this._mixin_val; }
  };

  it("should add no methods from an empty object", function() {
    var o = {};
    var newobj = mixin(o, {});
    expect(newobj.setter).toBeFalsy();
    expect(newobj.getter).toBeFalsy();
    expect(newobj._mixin_val).toBeFalsy();
  });

  it("should add two new methods to an object when they're mixed in", function() {
    var o = {};
    var newobj = mixin(o, meths);
    expect(newobj.setter).toBeDefined();
    expect(newobj.getter).toBeDefined();
    expect(newobj._mixin_val).toBeUndefined();
    newobj.setter(13);
    expect(newobj._mixin_val).toBeDefined();
    expect(newobj.getter()).toEqual(13);
  });

  var meths2 = {
    "xstring": "just a string",
    "xint": 13,
    "xfunction": function(arg) {
      return arg;
    },
  };

  it("should ignore any non-function attributes when mixing in", function() {
    var o = {};
    var newobj = mixin(o, meths2);
    expect(newobj.xfunction).toBeDefined();
    expect(newobj.xstring).toBeUndefined();
    expect(newobj.int).toBeUndefined();
    expect(newobj.xfunction(42)).toEqual(42);
  });
});

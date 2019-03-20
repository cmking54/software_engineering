/**
 * A basic mixin function that mixes any functions from *fromobj*
 * into the object *toobj*.
 *
 * Returns: toobj;
 */
"use strict";

var mixin = function(toobj, fromobj) {
    for (var attr in fromobj) {
        if (typeof(fromobj[attr]) === "function" && fromobj.hasOwnProperty(attr)) {
            toobj[attr] = fromobj[attr];
        }
    }
    return toobj;
};

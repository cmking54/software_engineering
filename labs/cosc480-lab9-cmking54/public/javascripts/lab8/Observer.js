"use strict";

/*
 * The main constructor function for an Observer
 */
function Observer() {
    if (this === undefined) {
        return new Observer();
    }
    this.observers = [];
};
Observer.prototype.subscribe = function(function_name) {
    this.observers.push(function_name);
};
Observer.prototype.unsubscribe = function(function_name) {
    this.observers.splice(this.observers.indexOf(function_name), 1);
};
Observer.prototype.publish = function() {
    for (var observer in this.observers) {
        this.observers[observer](arguments);
    }
};
/*
 * define methods on an Observer by adding them to 
 * Observer's prototype, such as:
 *
 *     Observer.prototype.subscribe = function( ...) {
 *
 *     };
 *
 */


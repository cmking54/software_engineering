describe("observer tests", function() {
  var testobj = (function(){
    var events = [];
    return {
      "sub1": function() {
        events.push(arguments);
      },
      "sub2": function() {
        events.push(arguments);
      },
      "sub3": function() {
        events.push(arguments);
      },
      "getEvents": function() {
        return events;
      },
      "clearEvents": function() {
        events = [];
      }
    };
  })();

  beforeEach(function() {
    testobj.clearEvents();
  });

  it("contains the right functions and methods", function() {
    expect(Observer).toBeDefined();
    expect(Observer.prototype.publish).toBeDefined();
    expect(Observer.prototype.subscribe).toBeDefined();
    expect(Observer.prototype.unsubscribe).toBeDefined();
  });

  it("implements the Observer function in a \"foolproof\" manner", function() {
    var obj = Observer();
    expect(obj instanceof Observer).toBe(true);

  });

  it("subscribes and publishes correctly with 1 receiver", function() {
    var obj = new Observer();
    obj.subscribe(testobj.sub1);
    obj.publish("hello!");
    expect(testobj.getEvents().length).toEqual(1);
  });

  it("subscribes and publishes correctly with 3 receivers", function() {
    var obj = new Observer();
    obj.subscribe(testobj.sub1);
    obj.subscribe(testobj.sub2);
    obj.subscribe(testobj.sub3);
    obj.publish("hello!");
    expect(testobj.getEvents().length).toEqual(3);
  });

  it("unsubscribes correctly for 1 receiver", function() {
    var obj = new Observer();
    expect(testobj.getEvents().length).toEqual(0);
    obj.subscribe(testobj.sub1);
    obj.publish("hear ye, hear ye");
    expect(testobj.getEvents().length).toEqual(1);
    obj.unsubscribe(testobj.sub1);
    obj.publish("hear ye, hear ye");
    expect(testobj.getEvents().length).toEqual(1);
  });

  it("unsubscribes correctly for 3 receivers", function() {
    var obj = new Observer();
    expect(testobj.getEvents().length).toEqual(0);
    obj.subscribe(testobj.sub1);
    obj.subscribe(testobj.sub2);
    obj.subscribe(testobj.sub3);
    obj.publish("hear ye, hear ye");
    expect(testobj.getEvents().length).toEqual(3);
    obj.unsubscribe(testobj.sub1);
    obj.publish("hear ye, hear ye");
    expect(testobj.getEvents().length).toEqual(5);
    obj.unsubscribe(testobj.sub2);
    obj.publish("hear ye, hear ye");
    expect(testobj.getEvents().length).toEqual(6);
    obj.unsubscribe(testobj.sub3);
    expect(testobj.getEvents().length).toEqual(6);
  });

  it("correctly unsubscribes a non-existent receiver", function() {
    var obj = new Observer();
    expect(testobj.getEvents().length).toEqual(0);
    obj.publish("yo yo");
    expect(testobj.getEvents().length).toEqual(0);
    obj.unsubscribe(function() {});
    obj.publish("yo yo");
    expect(testobj.getEvents().length).toEqual(0);
  });
});

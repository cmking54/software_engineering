"use strict";

var sights = (function() {
    // make any additional "private" function or variables here
    var vote = function(event) {
        var data = event.detail[0];
        jQuery("#upcount").text(data["up"]);
        jQuery("#downcount").text(data["down"]);
    };
    var comment = function(event) {
        jQuery("#commentbox").append(event.detail[2].responseText)
        jQuery("#commentbox")[0].value = "";
    };
    return {
        init: function() {
            //
            // do any initialization for javascript here
            // 
            jQuery("a[data-remote]").bind("ajax:success", vote);
            jQuery("form[data-remote]").on("ajax:success", comment);

        },
    };

})();
$(sights.init);


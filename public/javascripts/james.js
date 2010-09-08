function JamesClient() {
  if (! (this instanceof arguments.callee)) {
    return new arguments.callee(arguments);
  };

  var self = this;

  this.init = function() {
    self.setupBayeuxHandlers();
  };

  this.setupBayeuxHandlers = function() {
    self.client = new Faye.Client("http://node.denachtdienst.org/faye", {
      timeout: 120
    });

    self.client.subscribe('/activity', function (message) {
      self.logActivity(message);
    });
  };

  this.logActivity = function (message) {
    var ip = message.ip,
        location = message.location;

    $("#activity").prepend("<li><span class='ip'>" + ip +
    "</span> &raquo; <span class='location'>" + location + "</span></li>\n");
  };

  this.init();
};

var jamesClient;
jQuery(function(){
  jamesClient = new JamesClient();
});

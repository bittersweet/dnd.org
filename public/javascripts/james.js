function JamesClient() {
  if (! (this instanceof arguments.callee)) {
    return new arguments.callee(arguments);
  };

  var self = this;

  this.init = function() {
    self.setupBayeuxHandlers();
  };

  this.setupBayeuxHandlers = function() {
    /*
     Faye.Logging.logLevel = 'debug';
     Faye.logger = function(msg) { console.log(msg) };
    */

    self.client = new Faye.Client("http://localhost:8000/faye", {
      timeout: 40
    });

    self.client.subscribe('/activity', function (message) {
      self.logActivity(message);
    });
  };

  this.logActivity = function (message) {
    var location = message.location;

    $("#activity").prepend("<li><span class='location'>" + location + "</span></li>\n");
  };

  this.init();
};

var jamesClient;
jQuery(function(){
  jamesClient = new JamesClient();
});


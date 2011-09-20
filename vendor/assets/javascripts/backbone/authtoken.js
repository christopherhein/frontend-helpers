//
// With additions by Maciej Adwent http://github.com/Maciek416
// If token name and value are not supplied, this code Requires jQuery
//
// Adapted from:
// http://www.ngauthier.com/2011/02/backbone-and-rails-forgery-protection.html
// Nick Gauthier @ngauthier
//

var BackboneRailsAuthTokenAdapter = {

  //
  // Given an instance of Backbone, route its sync() function so that
  // it executes through this one first, which mixes in the CSRF 
  // authenticity token that Rails 3 needs to protect requests from
  // forgery. Optionally, the token's name and value can be supplied
  // by the caller.
  //
  fixSync: function(Backbone, paramName /*optional*/, paramValue /*optional*/){

    if(typeof(paramName)=='string' && typeof(paramValue)=='string'){
      // Use paramName and paramValue as supplied
    } else {
      // Assume we've rendered meta tags with erb
      paramName = $("meta[name='csrf-param']").attr('content');
      paramValue = $("meta[name='csrf-token']").attr('content');
    }

    // alias away the sync method
    Backbone._sync = Backbone.sync;

    // define a new sync method
    Backbone.sync = function(method, model, success, error) {

      // only need a token for non-get requests
      if (method == 'create' || method == 'update' || method == 'delete') {

        // grab the token from the meta tag rails embeds
        var auth_options = {};
        auth_options[paramName] = paramValue;

        // set it as a model attribute without triggering events
        model.set(auth_options, {silent: true});
      }

      // proxy the call to the old sync method
      return Backbone._sync(method, model, success, error);
    };
  },


  // change Backbone's sync function back to the original one
  restoreSync: function(Backbone){
    Backbone.sync = Backbone._sync;
  }
};

BackboneRailsAuthTokenAdapter.fixSync(Backbone);

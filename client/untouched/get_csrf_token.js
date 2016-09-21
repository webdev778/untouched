module.exports = function() {
  var metas = document.getElementsByTagName('meta');
  var rval = null;
  _.each(metas, function(el) {
    if (el.getAttribute('name') === 'csrf-token') {
      rval = el.getAttribute('content');
    }
  });

  return rval;
};


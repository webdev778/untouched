window.alt = new Alt();
window.p = function(msg) { console.log(msg); }

function getCSRFToken() {
  var metas = document.getElementsByTagName('meta');
  var rval = null;
  _.each(metas, function(el) {
    if (el.getAttribute('name') === 'csrf-token') {
      rval = el.getAttribute('content');
    }
  });

  return rval;
};

axios.defaults.headers['X-CSRF-Token'] = getCSRFToken();



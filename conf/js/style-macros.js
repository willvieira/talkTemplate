// Scale image (available on Remarkjs GH page)
remark.macros.scale = function (percentage) {
  var url = this;
  return '<img src="' + url + '" style="width: ' + percentage + '" />';
};

// Font-awesome icons (versio 4.7)
remark.macros.faic = function (size = 2) {
  var name = this;
  return '<i class="fab fa-'+ name + ' fa-'+ size + 'x" aria-hidden="true"></i>';
};

// Academicons
remark.macros.acic = function (size = 2) {
  var name = this;
  return '<i class="ai ai-'+ name + ' ai-'+ size + 'x" aria-hidden="true"></i>';
};

// toupper (see https://github.com/gnab/remark/issues/72)
remark.macros.upper = function () {
  // `this` is the value in the parenthesis, or undefined if left out
  return this.toUpperCase();
};

// Prevents the autoplaying of the animated Gifs
window.onload = function() {
  Gifffer();
}

remark.macros.giffer = function (percentage) {
  var url = this;
  return '<img data-gifffer="' + url + '" style="width: ' + percentage + '" />';
};
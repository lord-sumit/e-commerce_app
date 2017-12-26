function UpdateQuantity(quantity) {
  this.$quantity = quantity;
}

UpdateQuantity.prototype.bindEvents = function() {
  var _this = this;
  this.$quantity.on("change", function (event) {
    debugger;
    event.preventDefault();
    $.ajax({
      type: 'patch',
      dataType: 'json',
      url: '/carts/' + $(this).data('id') + '/update_quantity',
      data: { quantity: $(this).val(),
      line_item: $(this).line_item },
      success: function (response) {

      },
      error: function (response) {

      },
      done: function (response) {

      }
    });
  });
};

$(function() {
  var cart = new UpdateQuantity($(".quantity"));
  cart.bindEvents();
});


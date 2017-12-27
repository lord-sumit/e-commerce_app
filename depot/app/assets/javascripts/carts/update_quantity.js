function UpdateQuantity(quantity) {
  this.$quantity = quantity;
}

UpdateQuantity.prototype.bindEvents = function() {
  this.$quantity.on("change", function (event) {
    event.preventDefault();
    var _this = this;
    $.ajax({
      type: 'patch',
      dataType: 'json',
      url: '/carts/' + $(this).data('id') + '/update_quantity',
      data: { quantity: $(this).val(),
      line_item: $(this).data('lineitemid') },
      success: function (response) {
        var $total_price = $('[data-id=' + 'totalprice-' + $(_this).data('lineitemid') + ']');
        $total_price.text(response['updated_total_price']);
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

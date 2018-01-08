function AddToCart(links, cart_elements_no) {
  this.$links = links;
  this.$cart_elements_no = cart_elements_no;
};

AddToCart.prototype.bindEvents = function() {
  var _this = this;
  this.$links.on("click", function(event){
    console.log("pressed");
    $(this).disable;
    event.preventDefault();
    $.ajax({
      type : 'patch',
      dataType : 'json',
      url : '/products/' + $(this).data('id') + '/add_to_cart',
      success : function(response) {
        _this.$cart_elements_no.html(parseInt(_this.$cart_elements_no.html()) + 1)
      },
      error: function(response) {

      },
      done: function(response) {

      }
    });
  });
};


$(function() {
  var productLinks = new AddToCart($(".add_to_cart"), $("#cart_elements"));
  productLinks.bindEvents();
});

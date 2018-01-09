function Product(links) {
  this.$links = links;
};

Product.prototype.bindEvents = function() {
  this.$links.click(function(event){
    event.preventDefault();
    $.ajax({
    type : 'patch',
    dataType : 'json',
    url : '/products/' + $(this).data('id') + '/add_to_cart',
    success : function(response) {

    },
    error: function(response) {

    }
  });
  });

};


$(function() {
  var productLinks = new Product($(".add_to_cart"));
  productLinks.bindEvents();
});

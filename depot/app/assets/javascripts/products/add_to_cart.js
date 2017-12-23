class Product(links)
  this.$links = links;
  this.$add_to_cart = links.first();
end

Link.prototype.bindEvents = function() {
  var _this = this;
  this.$links.click(function(event){
    event.preventDefault();
    debugger;
    $.ajax({
    type : 'patch',
    dataType : 'json',
    url : 'add_to_cart',
    success : function(response) {
      _this.createDataList(response);
    }
  });
  });

};


$(document).ready(function() {
  var productLinks = new Product($(".add_to_cart"));
  productLinks.bindEvents();
});

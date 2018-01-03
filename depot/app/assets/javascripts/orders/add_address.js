function AddAddress(new_address) {
  this.$new_address = new_address;
}

AddAddress.prototype.bindEvents = function() {
  var _this = this;
  this.$new_address.on("click", function (event) {
    debugger;
    event.preventDefault();
    $.ajax({
      type : 'patch',
      dataType : 'json',
      url : '/orders/' + 'new',
      success : function(response) {

      },
      error: function(response) {

      },
      done: function(response) {

      }
    });
  });
};

$(function() {
  debugger;
  var address = new AddAddress($(".add_address"));
  address.bindEvents();
});

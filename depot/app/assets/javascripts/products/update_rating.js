function UpdateRating(rating) {
  this.$rating = rating;
}

UpdateRating.prototype.bindEvents = function() {

  this.$rating.on("change", function(event) {
    event.preventDefault();
    var _this = this;
    $.ajax({
      type: 'patch',
      dataType: 'json',
      url: '/products/' + $(this).data('id') + '/update_rating',
      data: { rating: $(this).val() },
      success : function (response) {
        var $rating = $('[data-id=' + 'rating-' + $(_this).data('id') + ']');
        $rating.html(response['updated_rating']);
      },
      error: function (response) {

      },
      done: function (response) {

      }
    });
  });
};

$(function() {
  var product = new UpdateRating($(".rating"));
  product.bindEvents();
})

$(".like-<%= @shop.id %>").replaceWith("<%= escape_javascript(render('shops/like' ,shop: @shop)) %>");

$('.btn-like').removeAttr('disabled');
$(".like_num_<%= @shop.id %>").replaceWith('<span class="like_num_<%= @shop.id %>"><%= @shop.likes.count %></span>');
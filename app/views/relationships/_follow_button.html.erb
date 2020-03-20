<% unless current_user == user %>
  <% if current_user.following?(user) %>
    <%= form_with(model: current_user.relationships.find_by(follow_id: user.id), local: true, method: :delete) do |f| %>
      <%= hidden_field_tag :follow_id, user.id %>
      <%= f.submit 'Unfollow', class: 'btn btn-danger btn-block' %>
    <% end %>
  <% else %>
    <%= form_with(model: current_user.relationships.build, local: true) do |f| %>
      <%= hidden_field_tag :follow_id, user.id %>
      <%= f.submit 'Follow', class: 'btn btn-primary btn-block' %>
    <% end %>
  <% end %>
<% end %>
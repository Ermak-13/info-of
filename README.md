INFO OF
=======

It is simple rails helper. It help displaying information of some object.
Instead of ...

`
"<div class="user">
	<div class="first_name">
		<div class="label">first name:</div>	
		<div class="value">some</div>
	</div>
	<div class="last_name">
		<div class="label">last name:</div>
		<div class="value">some</div>
	</div>
</div>"
`

you can write ...

`
"<%= info_of @user do |f| %>
	<%= f.info_field :first_name %>
	<%= f.info_field :last_name, :label => 'lol', :field_html => {}, :label_html => { 
		:tag_name => :span, :class => 'some' }, :value_html => {} %>
<% end %>"
`

You can customize some moments. You can pass any html attributes to field (wrapper), label
or value using :field_html, :label_html, :value_html. Option :tag_name set tag (wrapper, label or value). 
If you want other label than default you should pass value using options :label.


FUTURE
------

Yes, I know that I can make gem. And I should write test.
bla-bla-bla :)
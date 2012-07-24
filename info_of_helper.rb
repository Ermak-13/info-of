module InfoOfHelper
	def info_of(obj, options = {})
		attributes = options.merge({ :class => 'info-of' })
		div_for obj, attributes do
			yield InfoBuilder.new(obj)
		end
	end

	class InfoBuilder
		include ActionView::Helpers::TagHelper

		def initialize(obj)
			@obj = obj
		end

		def info_field(field_name, options = {})
			@options, @field_name = options, field_name
			element (field_label + field_value), { :class => "info-field #{field_name}" }, @options[:field_html]
		end

		private
			def field_label
				label_name = @options[:label] || @field_name.to_s.split('_').join(' ')
				element label_name, { :class => 'field-label' }, @options[:label_html]
			end

			def field_value
				element @obj.send(@field_name), { :class => 'field-value' }, @options[:value_html]
			end

			def element(value, default_options, options)
				attributes = options || {}
				tag_name = attributes.delete(:tag_name) || :div
				default_options.each do |key, value|
					attributes[key] = "#{attributes[key]} #{value}"
				end
				content_tag tag_name, value, attributes
			end
	end
end
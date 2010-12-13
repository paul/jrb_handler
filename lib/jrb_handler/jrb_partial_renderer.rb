require 'action_view'

module JrbHandler

  # Since I can't get the Rails team interested in making these changes, I have to monkey
  # patch some privatish methods in AV::Partials::PartialRenderer. Works in 3.0.1, but I
  # expect it to break frequently.
  class JrbPartialRenderer < ActionView::Partials::PartialRenderer

    # Skip rendering the results into a string, just leave it as an array.
    def render_collection
      return nil if @collection.blank?

      if @options.key?(:spacer_template)
        spacer = find_template(@options[:spacer_template]).render(@view, @locals)
      end

      result = @template ? collection_with_template : collection_without_template
      # Skip forcing the result into a sting. Everything above this is just like the original method
      #result.join(spacer).html_safe
    end

    # Tell the template finder we're not a partial, so it doesnt try to find the underscored method
    def find_template(path=@path)
      return path unless path.is_a?(String)
      prefix = @view.controller_path unless path.include?(?/)

      ##########
      @view.find_template(path, prefix, false)
      ##########
    end

  end

end

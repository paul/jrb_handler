require 'action_controller'

module JrbHandler::Renderers

  EPOCH = Time.utc(2000, 1, 1).iso8601

  ::ActionController::Renderers.add(:jrb_collection) do |resources, options|
    output = {
      :href    => request.url,
      :count   => resources.size,
      :items   => render(:ssaj1 => resources)
    }

    output = ActiveSupport::JSON.encode(output, :pretty => !Rails.env.production?)
    self.response_body = output
  end

  ::ActionController::Renderers.add(:jrb) do |resource, options|
    options[:partial] ||= resource
    #options.delete(:layout)

    output = JrbPartialRenderer.new(self.view_context, options, nil).render

    # If we got a set of resources, we're being rendered inside a collection,
    # so just return the results and let the collection renderer handle the rest
    return [] if output.nil?
    return output if output.is_a?(Array)

    output = ActiveSupport::JSON.encode(output, :pretty => !Rails.env.production?)
    self.response_body = output
  end

end

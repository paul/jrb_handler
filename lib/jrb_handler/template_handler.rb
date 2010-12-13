module JrbHandler
  class TemplateHandler < ActionView::Template::Handler
    include ActionView::Template::Handlers::Compilable

    ActionView::Template.register_template_handler(:jrb, self)

    self.default_format = Mime::JSON

    def compile(template)
      template.source
    end

  end
end



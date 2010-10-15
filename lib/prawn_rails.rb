require 'prawn'
require 'prawn/layout'
require 'prawn/security'
module Prawn
  module Rails
    class TemplateHandler < ActionView::Template::Handler
      self.default_format= :pdf
      def self.call(template)
        "pdf=Prawn::Document.new;\n"+
        "#{template.source}\n"+
        "pdf.render"
      end
    end
  end
end
Mime::Type.register_alias "application/pdf", :pdf
ActionView::Template.register_template_handler(:prawn, Prawn::Rails::TemplateHandler)

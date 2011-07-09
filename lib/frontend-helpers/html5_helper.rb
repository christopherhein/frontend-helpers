module FrontendHelpers
  module Html5Helper

    def html_tag(attrs = {}, &block)
      attrs.symbolize_keys!
      haml_concat "<!--[if lt IE 7]><html class='ie6 no-js'><![endif]-->".html_safe
      haml_concat "<!--[if IE 7]><html class='ie7 no-js'><![endif]-->".html_safe
      haml_concat "<!--[if IE 8]><html class='ie8 no-js'><![endif]-->".html_safe
      haml_concat "<!--[if gt IE 8]><!-->".html_safe
      haml_tag :html, attrs do
        haml_concat "<!--<![endif]-->".html_safe
        block.call
      end
    end

  end
end

ActionView::Base.send :include, FrontendHelpers::Html5Helper
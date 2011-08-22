module FrontendHelpers
  module MetatagHelper

    def meta_tags
      options = opts
      settings[:site].each do |s, k|
        meta(s, options)
      end
    end

  private ##########

    def settings
      YAML.load_file(File.join(Rails.root, 'config', 'settings.yml')) rescue {}
    end

    def setting(setting)
      ENV["SITE_#{setting.to_s.upcase}"] || settings[:site][setting]
    end

    def meta(name, options)
      if !name.blank? && !setting(name).blank? || options.include?(name) && options[name]
        options[:title] = ( !options[name].blank? ) ? "#{options[name]} #{setting(:title)}" : ""
        desc = (options.include?(name)) ? options[name] : setting(name)
        haml_concat raw "<meta content='#{setting(name)}' name='#{name.to_s}' />"
      end
    end

    def opts
      {
        title: @meta_title,
        keywords: @meta_keywords,
        description: @meta_description,
        author: @meta_author,
        email: @meta_email,
        copyright: @meta_copyright,
        generator: @meta_generator,
        rating: @meta_rating,
        language: @meta_language,
        distribution: @meta_distribution,
        robots: @robots,
        :"fb:app_id" => @meta_fb_app_id,
        :"og:title" => @meta_og_title,
        :"og:description" => @meta_og_description,
        :"og:url" => request.url,
        :"og:site_name" => @meta_og_site_name,
        :"og:type" => @meta_og_type,
        :"og:image" => @meta_og_image,
        :"og:locality" => @meta_og_locality,
        :"og:region" => @meta_og_region,
        :"og:country_name" => @meta_og_country_name,
        :"og:phone_number" => @meta_og_phone_number
      }
    end
  end
end

ActionView::Base.send :include, FrontendHelpers::MetatagHelper

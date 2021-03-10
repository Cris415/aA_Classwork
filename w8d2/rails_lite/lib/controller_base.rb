require 'active_support'
require 'active_support/inflector'
require 'active_support/core_ext'
require 'erb'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  def self.errors(error)
    if error == :double_render
      raise "Double render error"
    end
  end

  # Setup the controller
  def initialize(req, res)
    @req = req
    @res = res
    @already_built_response = false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    if already_built_response?
      ControllerBase.errors :double_render
    else
      @res.location = url
      @res.status = 302
      @already_built_response = true
    end
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    if already_built_response?
      ControllerBase.errors :double_render
    else
      @res.write(content)
      @res["Content-Type"] = content_type
      @already_built_response = true
      nil
    end
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    controller_name = self.class.name.underscore

    # path_str = "views/#{controller_name}/#{template_name}.html.erb"
    # folder = File.dirname(path_str)
    path_str = File.join("views", controller_name, template_name.to_s + ".html.erb")

    file_output = File.read(path_str)
    template = ERB.new(file_output).result(binding)

    render_content(template,'text/html')
  end

  # method exposing a `Session` object
  def session
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end


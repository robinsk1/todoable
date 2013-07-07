module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def cp(path)
    "active" if current_page?(path)
  end

  def city_image(project)
    if !project.pictures.empty? && !project.pictures.first.cover_image_uid.nil?
      project.pictures.first.cover_image.process(:greyscale).thumb('320x200#').url
    else
      "http://placehold.it/320x200"
    end
  end

end

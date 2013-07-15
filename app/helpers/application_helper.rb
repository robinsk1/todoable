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

  def city_image(project, size)
    if (project.kind_of? Project) && !(project.picture.nil?)
        project.picture.cover_image.thumb(size).url
    elsif project[:proj_id]
        Project.find(project[:proj_id]).picture.cover_image.thumb(size).url
    else
      "http://placehold.it/320x200"
    end
  end

end

module ApplicationHelper
  def calc_reading_progress(current_page, pages)
    if current_page >= pages
      tag.span('達成！！')
    else
      progress = (current_page.to_f / pages * 100).floor
      safe_join([
        tag.span("#{progress} %"),
        tag.br,
        tag.span("#{current_page} / #{pages}")
      ])
    end
  end

  def sidebar_link_to(path, emoji, text)
    classes = %w[my-1 nav-link text-color-link]
    classes << "active" if current_page?(path)

    link_to(path, class: classes) do
      tag.span(class: "me-2") { emoji } + tag.span { text }
    end
  end

  def icon(icon_name)
    tag.i(class: ["bi", "bi-#{icon_name}"])
  end

  def icon_with_text(icon_name, text)
    tag.span(icon(icon_name), class: "me-2") + tag.span(text)
  end

  def turbo_stream_flash
    turbo_stream.update "flash", partial: "flash"
  end
end

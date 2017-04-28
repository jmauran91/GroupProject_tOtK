module ApplicationHelper
  def created_or_updated(item)
    if item.updated_at == item.created_at
      "created"
    else
      "updated"
    end
  end
end

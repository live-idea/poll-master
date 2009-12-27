# Methods added to this helper will be available to all templates in the application.

module ApplicationHelper

  def translate_select_for(object, value='')
    translated_states = []

    case object
    when "anketa"
      if value == ''
        translated_states << [ t(:anketa_draft), "draft"]
        translated_states << [ t(:anketa_active), "active"]
      else
        case value
          when "draft" then translated = t(:anketa_draft)
          when "active" then translated = t(:anketa_active)
          else translated = "Unknown"
        end
      end
    when "poll"
      if value == ''
        translated_states << [ t(:poll_draft), "draft"]
        translated_states << [ t(:poll_active), "active"]
      else
        case value
          when "draft" then translated = t(:poll_draft)
          when "active" then translated =  t(:poll_active)
          else translated = "Unknown"
        end
      end
    when "question"
     if value == ''
      translated_states << [ t(:string_type), "string"]
      translated_states << [ t(:text_type), "text"]
      translated_states << [ t(:select_type), "select"]
      translated_states << [ t(:boolean_type), "boolean"]
     else
      case value
        when "boolean" then translated = t(:boolean_type)
        when "select" then translated = t(:select_type)
        when "string" then translated = t(:string_type)
        when "text" then translated = t(:text_type)
        else translated = "Unknown"
      end
     end
    else "Unknown"
    end
    if value == ''
      translated_states
    else
      translated
    end
  end

end

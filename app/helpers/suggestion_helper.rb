module SuggestionHelpers
  def with_line_breaks(body)
    body.gsub(/\n/, "<br />")
  end

  def authorship_tagline(suggestion)
    "Authored by #{suggestion.user_id} on #{longform_date(suggestion.created_at)}."
  end

  def thumbs_up_report(suggestion)
    case suggestion.thumbs_up
    when 0
      then "Be the first to thumbs up this suggestion."
    when 1
      then "1 reader has thumbs up this suggestion."
    else
      "#{suggestion.thumbs_up} readers have thumbs up'd this suggestion."
    end
  end

  private
  def longform_date(date)
    date.strftime("%B %d, %Y")
  end
end

class SeriesEventSerializer < BaseSerializer
  attributes :id, :title, :event_start_time, :event_end_time
  attributes :event_rounds

  def event_rounds
    object.event_rounds.map do |er|
      {
        round_num: er.round_num,
        course: er.course.name
      }
    end
  end
end

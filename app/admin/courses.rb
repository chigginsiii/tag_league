ActiveAdmin.register Course do
  permit_params :name, holes_attributes: [
    :position, :label
  ]

  member_action :add_hole, method: :put do
    resource.add_new_hole()
    redirect_to admin_course_path(course_id: params[:course_id]), notice: "Added Hole"
  end

  member_action :remove_hole, method: :put do
    resource.remove_hole(position: params[:position])
    redirect_to admin_course_path(course_id: params[:course_id]), notice: "Removed Hole"
  end

  show do
    attributes_table do
      row :name
    end

    columns do
      column do
        panel 'Holes' do
          para do
            link_to 'Add hole', add_hole_admin_course_path(
              resource,
              authenticity_token: form_authenticity_token.to_s
            ), method: :put
          end
          table_for course.holes do
            column 'Position', :position
            column 'Label', :label
            column 'Pins' do |hole|
              if hole.pins.size > 1
                hole.pins.map { |pin|
                  "#{pin.label}: #{pin.distance_value} #{pin.distance_unit} par #{pin.par}"
                }.join(', ')
              else
                pin = hole.pins.first
                "#{pin.distance_value} #{pin.distance_unit} par #{pin.par}"
              end
            end
            column do |hole|
              link_to 'remove', remove_hole_admin_course_path(
                resource,
                authenticity_token: form_authenticity_token.to_s,
                position: hole.position
              ), method: :put
            end
            column do |hole|
              link_to 'edit', edit_admin_course_hole_path(
                resource,
                hole,
              )
            end
          end
        end
      end
    end
  end
end
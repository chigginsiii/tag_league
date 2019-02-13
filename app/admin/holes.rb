ActiveAdmin.register Hole do
  belongs_to :course
  navigation_menu :course

  permit_params :position, :label, pins_attributes: [
    :id, :label, :distance_value, :distance_unit, :par
  ]

  show do
    attributes_table do
      row :position
      row :label
      row :course
    end

    panel "Pins" do
      table_for hole.pins do
        column :label
        column :distance_value
        column :distance_unit
        column :par
      end
    end
  end

  controller do
    def update
      update! do |format|
        format.html { redirect_to admin_course_path(params[:course_id]) }
      end
    end
  end

  form do |f|
    columns do
      column do
        f.inputs do
          f.input :position, label: "Position"
          f.input :label, label: "Label"
        end

        f.inputs do
          f.has_many :pins, new_record: "Add Pin" do |p|
            p.input :label, label: "Label"
            p.input :distance_value, label: "Distance"
            p.input :distance_unit, label: "units"
            p.input :par, label: "Par"
          end
        end

        actions
      end
      column do
      end
      column do
      end
    end
  end
end

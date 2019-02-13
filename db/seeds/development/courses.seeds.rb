dev_course = Course.find_by(name: "Test Course")
dev_course&.destroy

Course.create!(
  name: "Test Course",
  holes_attributes: [
    { position: 1, pins_attributes: [{ label: "A",  distance_value: 290, distance_unit: "ft", par: 3 }] },
    { position: 2, pins_attributes: [{ label: "A",  distance_value: 300, distance_unit: "ft", par: 3 }] },
    { position: 3, pins_attributes: [{ label: "A",  distance_value: 310, distance_unit: "ft", par: 3 }] },
    { position: 4, pins_attributes: [{ label: "A",  distance_value: 320, distance_unit: "ft", par: 3 }] },
    { position: 5, pins_attributes: [{ label: "A",  distance_value: 330, distance_unit: "ft", par: 3 }] },
    { position: 6, pins_attributes: [{ label: "A",  distance_value: 340, distance_unit: "ft", par: 3 }] },
    { position: 7, pins_attributes: [{ label: "A",  distance_value: 350, distance_unit: "ft", par: 3 }] },
    { position: 8, pins_attributes: [{ label: "A",  distance_value: 360, distance_unit: "ft", par: 3 }] },
    { position: 9, pins_attributes: [{ label: "A",  distance_value: 370, distance_unit: "ft", par: 3 }] },
    { position: 10, pins_attributes: [{ label: "A", distance_value: 380, distance_unit: "ft", par: 3 }] },
    { position: 11, pins_attributes: [{ label: "A", distance_value: 390, distance_unit: "ft", par: 3 }] },
    { position: 12, pins_attributes: [{ label: "A", distance_value: 400, distance_unit: "ft", par: 3 }] },
    { position: 13, pins_attributes: [{ label: "A", distance_value: 410, distance_unit: "ft", par: 3 }] },
    { position: 14, pins_attributes: [{ label: "A", distance_value: 420, distance_unit: "ft", par: 3 }] },
    { position: 15, pins_attributes: [{ label: "A", distance_value: 430, distance_unit: "ft", par: 3 }] },
    { position: 16, pins_attributes: [{ label: "A", distance_value: 440, distance_unit: "ft", par: 3 }] },
    { position: 17, pins_attributes: [{ label: "A", distance_value: 450, distance_unit: "ft", par: 3 }] },
    { position: 18, pins_attributes: [{ label: "A", distance_value: 460, distance_unit: "ft", par: 3 }] }
  ]
)

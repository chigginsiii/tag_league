
export interface CoursePin {
  label: string
  distance_value: number
  distance_unit: string
  par: number
}

export interface CourseHole {
  position: number
  label: string
  pins: CoursePin[]
}

export interface Course {
  name: string
  holes: CourseHole[]
}

! Free-form Fortran highlighting sample
module geometry
  implicit none
  private
  public :: circle, area

  type :: circle
    real :: radius
  end type circle

contains

  pure function area(shape) result(value)
    type(circle), intent(in) :: shape
    real :: value

    value = acos(-1.0) * shape%radius**2
  end function area
end module geometry

program demo
  use geometry, only: circle, area
  implicit none

  type(circle) :: shape
  shape%radius = 2.0
  print '(A,F8.3)', "area = ", area(shape)
end program demo

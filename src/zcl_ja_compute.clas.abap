class ZCL_JA_COMPUTE definition
  public
  final
  create public .

public section.

  class-methods GET_POWER
    importing
      !IV_BASE type I
      !IV_POWER type I
    exporting
      !EV_RESULT type P .
  class-methods GET_PERCENTAGE
    importing
      !IV_ACT type I
      !IV_MAX type I
    exporting
      !EV_RESULT type P .
protected section.
private section.
ENDCLASS.



CLASS ZCL_JA_COMPUTE IMPLEMENTATION.


  METHOD GET_PERCENTAGE.
    IF iv_max  = 0.
      ev_result = 0.
    ELSE.
      ev_result = iv_act / iv_max * 100.
    ENDIF.
  ENDMETHOD.


METHOD GET_POWER.

  CALL FUNCTION 'Z_BC00_POWER'
    EXPORTING
      iv_base               = iv_base
      iv_power              = iv_power
    IMPORTING
      ev_result             = ev_result
    EXCEPTIONS
      power_value_too_high  = 1
      result_value_too_high = 2.

  IF sy-subrc = 1.
    WRITE 'power too high'.
  ELSE.
    WRITE 'result too high'.
  ENDIF.

ENDMETHOD.
ENDCLASS.

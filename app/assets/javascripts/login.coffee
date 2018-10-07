(($) ->

  validate = (input) ->
    if $(input).attr('type') == 'email' or $(input).attr('name') == 'email'
      if $(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null
        return false
    else
      if $(input).val().trim() == ''
        return false
    return

  showValidate = (input) ->
    thisAlert = $(input).parent()
    $(thisAlert).addClass 'alert-validate'
    return

  hideValidate = (input) ->
    thisAlert = $(input).parent()
    $(thisAlert).removeClass 'alert-validate'
    return

  'use strict'

  $('.input100').each ->
    $(this).on 'blur', ->
      if $(this).val().trim() != ''
        $(this).addClass 'has-val'
      else
        $(this).removeClass 'has-val'
      return
    return

  input = $('.validate-input .input100')
  $('.validate-form').on 'submit', ->
    check = true
    i = 0
    while i < input.length
      if validate(input[i]) == false
        showValidate input[i]
        check = false
      i++
    check
  $('.validate-form .input100').each ->
    $(this).focus ->
      hideValidate this
      return
    return

  showPass = 0
  $('.btn-show-pass').on 'click', ->
    if showPass == 0
      $(this).next('input').attr 'type', 'text'
      $(this).addClass 'active'
      showPass = 1
    else
      $(this).next('input').attr 'type', 'password'
      $(this).removeClass 'active'
      showPass = 0
    return
  return
) jQuery


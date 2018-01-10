$(document).on 'click', 'form.add_fields', (event)->
time = new Date().getTime()
regexp = new RegExp($(this).data('id'),'g')
$(this).before($(this).data('document_families').replace(regexp, time))
event.defaultPrevented()
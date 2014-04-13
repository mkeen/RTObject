class RTObject
  constructor: (@native_object, @callback = (key, value, old_value)->) ->

  current: () ->
    @native_object

  set: (object) ->
    native_object_copy = @native_object
    for key, value of object
      if typeof @native_object[key] != 'undefined'
        if @native_object[key] != object[key]
          this.change key, value

      else
        this.add key, value

    this.change native_object_copy

  add: (key, value) ->
    @native_object[key] = value
    this.changed key, value, null

  change: (key, value) ->
    native_object_copy = @native_object
    @native_object[key] = value
    this.changed(key, value, native_object_copy[key])

  changed: (key, value, old_value) ->
    @callback(key, value, old_value)

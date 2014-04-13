describe 'An object map with asynchronous change notifications', ->
  it 'can be initialized with a native object', ->
    native_object = key1: 'value1', key2: 'value2'
    obj = new RTObject native_object
    expect obj.current()
           .toBe native_object

  it 'will provide notifications when a key is created
      or its value modified', ->
    native_object = key1: 'value1', key2: 'value2'
    modified_object = key1: 'diff_value', key2: 'value2', key3: '123'
    callback = (key, value, old_value) ->
      console.log("called")
    obj = new RTObject native_object, callback
    spyOn obj, 'changed'
    obj.set modified_object
    expect obj.changed
           .toHaveBeenCalled()

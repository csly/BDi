jQuery ->
  new CarrierWaveCropper()

class CarrierWaveCropper
  constructor: ->
    $('#staff_photo_cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 200, 200]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#staff_photo_crop_x').val(coords.x)
    $('#staff_photo_crop_y').val(coords.y)
    $('#staff_photo_crop_w').val(coords.w)
    $('#staff_photo_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#staff_photo_previewbox').css
      width: Math.round(100/coords.w * $('#staff_photo_cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#staff_photo_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'


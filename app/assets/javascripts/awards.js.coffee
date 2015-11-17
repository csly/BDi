jQuery ->
  new CarrierWaveCropper()

class CarrierWaveCropper
  constructor: ->
    $('#award_image_cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 200, 200]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#award_image_crop_x').val(coords.x)
    $('#award_image_crop_y').val(coords.y)
    $('#award_image_crop_w').val(coords.w)
    $('#award_image_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#award_image_previewbox').css
      width: Math.round(100/coords.w * $('#award_image_cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#award_image_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'

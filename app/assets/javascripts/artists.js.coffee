jQuery ->
  new CarrierWaveCropper()

class CarrierWaveCropper
  constructor: ->
    $('#artist_photo_cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 200, 200]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#artist_photo_crop_x').val(coords.x)
    $('#artist_photo_crop_y').val(coords.y)
    $('#artist_photo_crop_w').val(coords.w)
    $('#artist_photo_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#artist_photo_previewbox').css
      width: Math.round(100/coords.w * $('#artist_photo_cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#artist_photo_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'

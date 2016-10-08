jQuery ->
  new CarrierWaveCropper()

class CarrierWaveCropper
  constructor: ->
    $('#shop_item_image_cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 200, 200]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#shop_item_image_crop_x').val(coords.x)
    $('#shop_item_image_crop_y').val(coords.y)
    $('#shop_item_image_crop_w').val(coords.w)
    $('#shop_item_image_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#shop_item_image_previewbox').css
      width: Math.round(100/coords.w * $('#shop_item_image_cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#shop_item_image_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'

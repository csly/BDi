(function() {
  var CarrierWaveCropper,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  jQuery(function() {
    return new CarrierWaveCropper();
  });

  CarrierWaveCropper = (function() {
    function CarrierWaveCropper() {
      this.updatePreview = bind(this.updatePreview, this);
      this.update = bind(this.update, this);
      $('#artist_photo_cropbox').Jcrop({
        aspectRatio: 1,
        setSelect: [0, 0, 200, 200],
        onSelect: this.update,
        onChange: this.update
      });
    }

    CarrierWaveCropper.prototype.update = function(coords) {
      $('#artist_photo_crop_x').val(coords.x);
      $('#artist_photo_crop_y').val(coords.y);
      $('#artist_photo_crop_w').val(coords.w);
      $('#artist_photo_crop_h').val(coords.h);
      return this.updatePreview(coords);
    };

    CarrierWaveCropper.prototype.updatePreview = function(coords) {
      return $('#artist_photo_previewbox').css({
        width: Math.round(100 / coords.w * $('#artist_photo_cropbox').width()) + 'px',
        height: Math.round(100 / coords.h * $('#artist_photo_cropbox').height()) + 'px',
        marginLeft: '-' + Math.round(100 / coords.w * coords.x) + 'px',
        marginTop: '-' + Math.round(100 / coords.h * coords.y) + 'px'
      });
    };

    return CarrierWaveCropper;

  })();

}).call(this);

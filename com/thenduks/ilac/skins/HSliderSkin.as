package com.thenduks.ilac.skins {
  import mx.skins.ProgrammaticSkin;
  import flash.geom.Matrix;
  import com.thenduks.ilac.IlacUtil;

  public class HSliderSkin extends ProgrammaticSkin {

    override public function get height():Number {
      return 20;
    }

    override protected function updateDisplayList( w:Number, h:Number ):void {
      super.updateDisplayList( w, h );

      var newColors:Array = IlacUtil.stringAsArray( getStyle( 'fillColors' ) );

      //create 2 circle that will act like round corners
      this.graphics.beginFill( newColors[0], 1 );
      this.graphics.drawCircle( 0, 0, 5 );
      this.graphics.endFill();
      this.graphics.beginFill( newColors[1], 1 );
      this.graphics.drawCircle( w, 0, 5 );
      this.graphics.endFill();

      this.graphics.beginGradientFill(
        'linear', newColors,
        [ 1, 1 ], [ 0, 255 ],
        horizontalGradientMatrix( 0, 0, w, 10 )
      );
      this.graphics.drawRect( 0, -5, w, 10 );
      this.graphics.endFill();
    }
  }
}

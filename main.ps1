add-type -AssemblyName system.Drawing, system.Windows.Forms

# create Bitmap and Graphics Object
$bitmap = New-Object System.Drawing.Bitmap(1, 1)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)

# get the cursor location
$dpiScaling = 1.0
$PositionX = [System.Windows.Forms.Cursor]::Position.X * $dpiScaling
$PositionY = [System.Windows.Forms.Cursor]::Position.Y * $dpiScaling

# get the RGB value of the pixel color
$graphics.CopyFromScreen($positionX, $positionY, 0, 0, $bitmap.Size)
$pixel = $bitmap.GetPixel(0, 0)

# write the RGB on the console
$decValue = "RGB({0}, {1}, {2})" -f $pixel.R, $pixel.G, $pixel.B
$hexValue = "#{0:X2}{1:X2}{2:X2}" -f $pixel.R, $pixel.G, $pixel.B
Write-Host "$decValue, $hexValue"
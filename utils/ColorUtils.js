var ColorUtils = (() => {
  var emptyColor = '#000000'
  
  var _intToPaddedHex = int => ('00' + int.toString(16)).slice(-2)
  
  var _randomChannel = () => Math.floor(Math.random() * 256)

  var randomColor = () => ({
    r: _randomChannel(),
    g: _randomChannel(),
    b: _randomChannel(),
    a: 1
  })

  var priceColorMaxPrice = 100000000000000

  /*
    i = 0   => 0, 255, 0 green
    i = 0.5 => 255, 255, 0 yellow
    i = 1   => 255, 0, 0 red
    clamped at 0.0001 eth for now...
  */
  var priceAsColor = price => {    
    let intensity = price / priceColorMaxPrice
    return new Uint8ClampedArray([510 * intensity, 510 * (1 - intensity), 0, 255])
  }

  var rgbaToHex = rgba => `#${ _intToPaddedHex(rgba.r) }${ _intToPaddedHex(rgba.g) }${ _intToPaddedHex(rgba.b) }`

  var rgbaToBytes3 = rgba => `0x${ rgbaToHex(rgba).substr(1,6) }`

  var rgbaToIntArray = rgba => [rgba.r, rgba.g, rgba.b, rgba.a * 255]

  var rgbaToString = rgba => `rgba(${Object.values(rgba).join(', ')})`

  var intArrayToRgba = int_array => ({
    r: int_array[0],
    g: int_array[1],
    b: int_array[2],
    a: int_array[3] / 255
  })

  var intArrayToHex = int_array => `#${ _intToPaddedHex(int_array[0]) }${ _intToPaddedHex(int_array[1]) }${ _intToPaddedHex(int_array[2]) }`
  
  var bytes3ToRgba = bytes3 => ({
    r: parseInt(bytes3.substr(2, 2), 16),
    g: parseInt(bytes3.substr(4, 2), 16),
    b: parseInt(bytes3.substr(6, 2), 16),
    a: 1
  })
  
  var bytes3ToIntArray = bytes3 => [parseInt(bytes3.substr(2, 2), 16), parseInt(bytes3.substr(4, 2), 16), parseInt(bytes3.substr(6, 2), 16), 255]

  return {
    rgbaToBytes3: rgbaToBytes3,
    rgbaToHex: rgbaToHex,
    rgbaToIntArray: rgbaToIntArray,
    rgbaToString: rgbaToString,
    bytes3ToIntArray: bytes3ToIntArray,
    bytes3ToRgba: bytes3ToRgba,
    intArrayToRgba: intArrayToRgba,
    intArrayToHex: intArrayToHex,
    emptyColor: emptyColor,
    randomColor: randomColor,
    priceAsColor: priceAsColor,
    priceColorMaxPrice: priceColorMaxPrice
  }
})()

export default ColorUtils
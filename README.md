# GNBank

## Funcionalidad

1. Listar los productos de GNB
2. Saber la suma total en € de cada producto pero mostrar cada uno de sus gastos con sus monedas

## Especificaciones

1. Hacer uso de http://quiet-stone-2094.herokuapp.com/transactions.json para saber todos sus productos y sus gastos
2. Hacer uso de http://quiet-stone-2094.herokuapp.com/rates.json para la conversión de las monedas a euro (Algunas conversiones pueden no especificarse, y en caso de que sean necesarias, deberán ser calculado utilizando las conversiones ya conocidas).

## Requerimientos

● Requerido usar Xcode - Swift

● Se puede hacer uso de frameworks y librerías de terceros.

● No bloquee la interfaz de usuario mientras descarga los datos de la red.

● Recuerde que faltan algunas tasas de conversión y deben derivarse utilizando la información proporcionada. Después de cada conversión, el resultado se debe redondear a dos decimales, utilizando Redondeo bancario (http://en.wikipedia.org/wiki/Rounding#Round_half_to_even).

● No hace falta crear tests.

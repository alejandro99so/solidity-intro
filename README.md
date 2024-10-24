## Versión en Español

## solidity-intro

Este repositorio está enfocado en la mayoría de conceptos básicos de Solidity, esta es una buena guía para estudiar si estás iniciando en este mundo, parte de los códigos vistos aquí están basados en https://github.com/solangegueiros/register-learn-solidity.

Antes de iniciar con la programación de Contratos inteligentes es muy importante tener claro algunos conceptos clave, como lo son:

- Licencia: Se suele usar este encabezado (`// SPDX-License-Identifier: MIT`) en todos los contratos inteligentes, esto es usado para declarar la licencia y recibir permiso de uso, edición, distribución, y todo lo que requerimos para crear código y ser los dueños de productos con esta base tecnológica.

- Versión del compilador: Lo segundo que tiene un encabezado es la versión del compilador `pragma solidity 0.8.20;`, esta versión es muy importante ya que es la encargada de compilar nuestro código y enviarlo a lenguaje que la máquina virtual de Ethereum pueda entender, en estas versiones van corrigiendo problemas que han causado hackeos o problemas de memoria, a continuación un ejemplo de desbordamiento de memoria en una versión antigua del compilador:

<pre>
<code>
// SPDX-License-Identifier: MIT
pragma solidity ^0.4.17;

contract OverflowExample {
    uint8 public counter = 255; // Valor máximo para uint8

    function incrementCounter() public {
        counter += 1; // Aquí ocurre un desbordamiento
    }
}
</code>
</pre>

- Declaración del contrato: Para crear un contrato además de todo lo anterior mencionado es necesario usar la palabra reservada `contract` seguida del nombre del contrato con la primera letra en mayúscula como en el ejemplo de `OverflowExample` quedando algo así `contract OverflowExample { ... }` donde los `...` representan nuestro código dentro del contrato.

- Tipos de variable: En solidity existen tres tipos de variables, las cuales son:
  1. Locales: Se declaran dentro de una función y no se guardan en la blockchain.
  2. Estado: Se declaran fuera de las funciones, dentro del contrato y se guardan en la blockchain.
  3. Globales: Son las variables que nos proveen de información general de la blockchain, como la estampa actual de tiempo, el número del bloque, o información de quien está interactuando con el contrato o cuántos activos está enviando al contrato y demás.
- Visibilidad: A lo largo del contrato veremos algunas palabras en las funciones, como `external`, `public`, `internal` o `private`, los cuales nos sirven para definir una visibilidad tanto para funciones como para variables de estado, a continuación, entenderemos para que sirve cada una:

  1. external: Este tipo de visibilidad indica que las funciones nombradas de esta manera pueden ser usadas al interactuar con el contrato, o desde otro contrato, si heredamos de este, pero no desde el mismo contrato, es decir, si tenemos una función que calcule algo pero nadie más en nuestro contrato la necesita, se puede definir `external`, si se tiene `f()`, no se puede llamar `f()` dentro de otra función, pero si se puede llamar `this.f()`.
  2. public: Este tipo de visibilidad es muy parecida a la external, salvo que las funciones definidas como `public` pueden ser consultadas también por otras funciones del contrato y pueden ser asignadas a variables de estado, para indicarle al compilador que cree de manera automática funciones de lectura que permitirán obtener el valor de dichas variables de estado.
  3. internal: Este tipo de visibilidad permite acceder a las variables o funciones solo internamente, es decir, solo desde el mismo contrato mediante una función o mediante una función de otro contrato.
  4. private: Este tipo de visibilidad permite acceder a las variables o funciones solo dentro del contrato en el que se definieron, no se pueden acceder desde otros contratos.

- memory vs calldata vs storage: Cuando tengamos una función con parámetros de entrada de tipo string, array, struct o mapping, o queramos usar una variable local con estas características, debemos definir el alcande la memoria utilizada para almacenar estas variables, en estos casos solemos tener 3 opciones `memory`, `calldata` o `storage`.
  1. storage: Este tipo de memoria permite almacenar variables en la blockchain cuyo valor persiste en el tiempo y en el contrato inteligente, por lo que se puede acceder a estas variables después de que se haya terminado de ejecutar funciones dentro de un contrato y posteriormente a eso, son usadas para almacenar datos persistentes o variables de estado.
  2. memory: Este tipo de memoria permite almacenar variables de manera temporal y cuya existencia se remonta solo al tiempo de existencia de la función en la cual se creó, ejemplo de este tipo de memoria es la asignada a variables locales dentro de funciones, ya que almacenan datos temporales que no se necesitarán una vez se termine de ejecutar la función que le dio vida.
  3. calldata: Por último este tipo de memoria es muy similar a `memory`, con la diferencia de que esta se suele usar para argumentos de funciones, ya que las variables definidas en este tipo de memoria son de solo lecturas, es decir inmutables, por lo que se usan para variables cuya existencia es temporal e inmutable.

### 0_read_write.sol

En el contrato `ReadWrite` tienes la variable de estado `myText`, puedes actualizar este valor con la función `setText`, o puedes retornar el valor de la variable con la función `getText`.

### 1_read_write_v2.sol

En el contrato `ReadWrite` puedes hacer lo mismo que en el ejemplo anterior, adicional puedes medir el número de cambios hechos a lo largo de la historia.

### 2_read_write_constructor.sol

En el contrato `ReadWriteConstructor` puedes hacer lo mismo que en el ejemplo anterior, adicional puedes observar un nuevo concepto, un constructor es una "función" que es llamada por el contrato inteligente al momento de su creación, por lo que puedes guardar información como la billetera de quien lo desplegó, la estampa de tiempo y más.

### 3_read_write_owner.sol

En el contrato de `ReadWriteOwner` puedes ver un nuevo concepto, el "owner", este es asignado cuando se crea el contrato inteligente en la función del constructor, usando el valor `msg.sender`, la cual es una variable global con la dirección pública de quien desplegó el contrato inteligente. Este concepto es usado para restringir el acceso en algunas funciones, es muy común en contratos inteligentes más complejos.

### 4_read_write_require.sol

En el contrato de `ReadWriteRequire` puedes ver un nuevo concepto, el "require", este es similar al "if", porque tienes una condición que debe ser cumplida, si esto no pasa, el código no continúa ejecutándose, pero comparado con el "if" nos da un nuevo concepto, el "callback", este retorna el estado de cada "variable de estado" al estado inicial antes de llamar la función, adicional este muestra un mensaje de error en caso de tener uno.

### 5_global_info.sol

En el contrato `global_info` puedes encontrar seis funciones que retornan algunas variables globales.

- block.timestamp: Esta variable retorna la fecha en el formato unix (estándar de fechas. REF: https://www.unixtimestamp.com).
- block.number: Esta variable retorna el número del bloque que está procesando la transacción.
- block.chainid: Esta variable muestra el id de la cadena de la blockchain que se está usando.
- msg.value: Esta variable retorna el valor de crypto enviado por el usuario quien interactúa con el contrato inteligente.
- msg.sender: Esta variable retorna la dirección del usuario quien está interactuando con el contrato inteligente.
- tx.origin: Esta variable retorna la dirección de quien inició la transacción.

### 6_challenge

Tienes que crear un contrato inteligente que reciba dinero de cualquier persona, este tiene que ser capaz de reconocer al usuario y bloquear los fondos recibidos por cada uno de ellos por un año después de la transacción. Ejemplo: Juan ahorra 1000 wei en un contrato, el día 06/08/2023, Juan puedes retirar el dinero solamente después de 06/08/2024, considerando la hora, minutos y segundos.

Te invito a crear un PR con tu solución y etiquetarme en las redes sociales: @alejandro99so en instagram y X (Twitter).

### 7_modifier.sol

En el contrato `MyModifier` se introduce un nuevo concepto, el modifier, es una palabra reservada y la definición parece una función, pero con la particularidad de que esta "función" es usada en el encabezado de otras funciones, con el objetivo de modificar el comportamiento de esta función, el equivalente a un middleware, o interceptor, ya que se suele ejecutar antes del cuerpo de la función.
Para saber si se ejecuta antes o después se usa `underscore placeholder` que se ve así: `_;`, y este representa la ejecución del código de la función.

- Caso 1: Si se tiene código antes del `underscore placeholder` este código del modifier se ejecutará antes del de la función.
- Caso 2: Si se tiene código después del `underscore placeholder` este código del modifier se ejecutará después de ejecutada la función.

Es más común el caso 1.

### 8_event.sol

En el contrato `MyEvent` se introduce nuevamente un concepto nuevo, el `event`, este también usa una palabra reservada, esta seguida de algo similar al encabezado de una función, ya que recibe el nombre y los parámetros de entrada con su respectivo tipo.

Estos eventos son muy útiles para conocer el estado de un contrato, ya que podemos reportar eventos importantes que requiera monitoreo y hacer que estos eventos ejecuten un endpoint, muestren algo en un front en tiempo real, nos notifique a un canal y mucho más, solo se requiere emitirlo en la función que requiramos y pasarle los valores de las variables que requerimos.

### 9_modifier_event.sol

En el contrato `MyModifierEvent` se combinan modificadores y eventos, se ve como el modificador `onlyOwner`, valida que quien llama la función sea quien creo el contrato y una vez lo valida emite un evento informando la modificación de la variable de tipo texto.

### 10_array.sol

En el contrato `MyArray` se define por primera vez en esta guía los arreglos, en este se observa `string[] private myTexts;`, lo cual muestra una variable llamada `myTexts`, con una visibilidad privada, la definición de `string[]` nos dice que será un arreglo de `string`, con esto en mente ya podremos usar las operaciones de los arreglos. Algunas de ellas son:

1. push: permite agregar un elemento al final del arreglo, es decir, si tengo dos elementos, puedo agregar un tercero.
2. length: permite saber la longitud del arreglo, recordemos que los índices o posiciones empiezan en 0, por lo tanto, si un arreglo tiene dos elementos, el índice del último elemento será 2 - 1, es decir 1, por lo que se obtiene restando uno a la longitud del arreglo.
3. `[index]`: permite asignar una variable a una posición particular del arreglo, debemos asegurar que dicha posición exista para no tener errores dentro del código, si tenemos un arreglo de diez posiciones, podremos asignar desde `myTexts[0]` hasta `myTexts[9]` ya que el último indice será 10 - 1 = 9.

### 11_array_conditional.sol

En el contrato `MyArrayConditional` se vuelve a observar un arreglo, y adicional se observa una implementa un condicional, un ciclo y un arreglo de strings definido de manera local, por lo que se usa `memory` para especificarle al compilador que guarde la variable en una memoria temporal, también se observa algo nuevo, la expresión `new string[](totalNewArray)`, después de la definición conocida de `string[]` entre paréntesis se define el tamaño del arreglo, limitando el espacio de memoria que queremos reservar para el arreglo de string.
También se observa que el ciclo es muy similar a los que se observan en otros lenguajes como `javascript`, `for (uint i = start; i <= end; i++){}`, donde primero se especifica la variable que se incrementara (`i`), luego el límite de `i`, y por último la manera en la que incrementara la variable `i`, seguido por `{}` donde va el código a ejecutar en el código.

### 12_whitelist.sol

En el contrato `MyWhiteList` se observa un nuevo tipo de variable `mapping`, este tipo de variable es muy parecido a los objetos, con la particularidad de que las llaves deben ser todas del mismo tipo, así como los valores (entiéndase por llave y valor los dos componentes de un objeto `{llave: valor}`) también deben ser del mismo tipo, por ejemplo se puede relacionar un valor numérico por cada valor de address teniendo una definición así `mapping (address => uint8)`, o en este caso un permiso por cada dirección `mapping (address => bool)`, donde el `true` indica que se tiene acceso a algo, este tipo de variables del tipo `mapping (address => bool)` suelen ser usadas para dar permisos en contratos inteligentes, algunos como el de compra anticipada de un activo digital, o permisos de edición o actualización de variables de estado, este tipo de permisos reciben el nombre de `whitelist`, ya que son listas de direcciones con permisos especiales, se puede acceder al valor referenciando la llave del mapping, como el ejemplo de `whiteList[msg.sender]`, donde se recibirá un valor `bool`.

### 13_challenge_2

Tienen que crear un contrato inteligente que en el constructor reciba un total supply, para saber cuánto es lo máximo que puede recaudar, solo reciba fondos de una whiteList, y cuando se llegue a ese supply en el balance del contrato, solo la whiteList pueda decidir que wallet recibirá los fondos, esto por una votación que puede iniciar cualquiera de la whitelist siempre que se haya llegado al total supply y tenga una vigencia de 1 semana, una vez se termine la votación o la semana, cualquiera de la whitelist puede llamar una función que transfiere los fondos a la billetera ganadora. Ejemplo: Andres, Juan, Maria y Fernanda están ahorrando en ese contrato, una vez llegan a los 1000 USD de dinero ahorrado, Maria llama la función para iniciar la votación y saber en qué se gastaran esos ahorros, ella vota enviar los fondos a la wallet de Daniel, el cual trabaja en una agencia de viajes y le cotizó un plan turístico para los 4 a Cartagena por los 1000 USD; Andres vota por enviar el dinero a Pedro el cual administra un teatro y pronto vendrá un cantante el cual es muy reconocido en la ciudad y las cuatro entradas cuestan 1000 USD; Juan después de pensarlo por 5 días decide votar por el viaje a Cartagena y Fernanda estaba despistada y no votó.
Al final Ganó el viaje a cartagena por lo que Andres retira los fondos llamando una función que transfiere automáticamente el crypto a Daniel, el cual reserva los tiquetes y hospedaje para los 4 amigos en Cartagena.

Te invito a crear un PR con tu solución y etiquetarme en las redes sociales:
@alejandro99so en instagram y X (Twitter).

### 14_enum.sol

En el contrato `MyEnum` se observa un nuevo tipo de variable `enum`, este como tal no es un tipo de variable por sí solo como el `mapping`, pero permite crear un tipo de variable; estos tipos de variables que son creados almacenan estados, que a nivel de maquina son interpretados como `uint`, ya que el primer elemento es `0`, el segundo es `1`, el tercero es `2` y así sucesivamente, pero a nivel de desarrollador ese 0 tiene un significado, este tipo de variable puede parecer ilogica a primera vista ya que es un camuflaje para enteros, pero tiene sentido al momento de pensar en buenas prácticas de desarrollo, ya que permite que nuestro código sea más legible por otros desarrolladores y por nuestro yo del futuro, la manera de acceder a estos `"estados"` es llamando al tipo de variable creada seguida de un punto y del estado que queremos acceder (`Colors.Undefined`), el primer estado definido será 0 por lo que al usar una comparación si queremos que `Colors.Undefined == myVariable` sea `true`, debemos asegurarnos que `myVariable` sea 0.
Nota: En este caso `0` es `Undefined` por el ejemplo, pero `0` puede ser `Blue`, si esta variable se define en orden antes que `Undefined` en el ejemplo de `enum Colors {Undefined, Blue, Red}`.

## English version

## solidity-intro

This repository is focused on the most basic concepts about solidity, it's a guide to study if you're starting in this world. Some of the codes seen here are based on: https://github.com/solangegueiros/register-learn-solidity

Before delving into Smart Contract programming, it's crucial to have a clear understanding of some key concepts, such as:

- License: It's common to use this header (`// SPDX-License-Identifier: MIT`) in all smart contracts. This is used to declare the license and grant permission for use, editing, distribution, and everything needed to create code and own products based on this technology foundation.

- Compiler Version: The second thing in a header is the compiler version (`pragma solidity 0.8.20;`). This version is very important, as it compiles our code and translates it into a language that the Ethereum virtual machine can understand. These versions correct issues that have caused hacks or memory problems. Here's an example of a memory overflow in an older compiler version:

<pre>
<code>
// SPDX-License-Identifier: MIT
pragma solidity ^0.4.17;

contract OverflowExample {
    uint8 public counter = 255; // Maximum value for uint8

    function incrementCounter() public {
        counter += 1; // Overflow occurs here
    }
}
</code>
</pre>

- Contract Declaration: To create a contract, besides everything mentioned above, you need to use the reserved keyword `contract`, followed by the contract name, with the first letter in uppercase, as in the example of `OverflowExample`, resulting in something like `contract OverflowExample { ... }`, where the `...` represents our code inside the contract.

### 0_read_write.sol

In `ReadWrite` contract you have a state variable called `myText`, so you can update this value with `setText` function, or you can return the value of variable with `getText` function.

### 1_read_write_v2.sol

In `ReadWrite` contract you can do the same than previous example, plus you can measure the number of changes made throughout history.

### 2_read_write_constructor.sol

In `ReadWriteConstructor` contract you can do the same than previous example, plus you can see a new concept, constructor is a "function" that is called at smart contract creation time, so you can save information like wallet who deployed, timestamp and more.

### 3_read_write_owner.sol

In `ReadWriteOwner` contract you can see a new concept, the "owner", it is set when the smart contract is created in the constructor function, using the value of `msg.sender`, which is a global variable with the address who deployed that smart contract. This concept is used to lock the access in some functions, it is very common in more complex smart contracts.

### 4_read_write_require.sol

In `ReadWriteRequire` contract you can see a new concept, the "require", it is similar to "if", because you have a condition that have to be done, if it don't work, it not continue running the code, but it compared with "if" give us a new concept "callback", it return the state of every "state variable" to the init state before calling the function, plus it displays an error message on error.

### 5_global_info.sol

In `global_info` contract you can find six functions returning some global variables.

- block.timestamp: this variable return the date in unix format (standar of dates. REF: https://www.unixtimestamp.com).
- block.number: this variable return the number of the block that is processing the transaction.
- block.chainid: this variable show the chain id of blockchain used.
- msg.value: this variable return the amount of crypto sended by user who interact with the smart contract.
- msg.sender: this variable return the address of user who is interacting with the smart contract.
- tx.origin: this variable return the address who started the transation.

### 6_challenge

You have to create a smart contract what receive money for anyone, it has to be able to recognize the user and lock the money received by every user for one year after user transaction. Example: Juan save 1000 Wei, on 08/06/2023, Juan can withdrawal the money just after 08/06/2024, considering the hour, minutes and seconds.

I invite you to create a PR with your solution and tag me in social media @alejandro99so in instagram and X (Twitter) with the URL of this.

### 7_modifier.sol

In `MyModifier` contract, a new concept is introduced: the modifier. It's a reserved keyword, and its definition appears like a function, but with the peculiarity that this "function" is used in the header of other functions. Its purpose is to modify the behavior of these functions, acting as an equivalent to a middleware or interceptor, as it's usually executed before the function's body.
To determine whether it's executed before or after, an `underscore placeholder` is used, which looks like this: `_ ;`, and it represents the execution point of the function's code.

Case 1: If there's code before the `underscore placeholder`, the modifier's code will execute before the function's code.
Case 2: If there's code after the `underscore placeholder`, the modifier's code will execute after the function has executed.

Case 1 is more common.

### 8_event.sol

In `MyEvent` contract, a new concept is introduced: the `event`. This also uses a reserved keyword, followed by something similar to a function header, as it receives the name and input parameters along with their respective types.

These events are very useful to track the state of a contract, as we can report important events that require monitoring. We can make these events trigger an endpoint, display something on a real-time front-end, notify us through a channel, and much more. It only requires emitting the event in the desired function and passing the values of the variables we need.

### 9_modifier_event.sol

In `MyModifierEvent` contract, modifiers and events are combined. It showcases the `onlyOwner` modifier, which validates that the caller of the function is the one who created the contract. Once it validates this, it emits an event informing about the modification of the text-type variable.

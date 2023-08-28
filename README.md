## Versión en Español
## solidity-intro

Este repositorio está enfocado en la mayoría de conceptos básicos de Solidity, esta es una buena guía para estudiar si estás iniciando en este mundo, parte de los códgos vistos aquí están basados en https://github.com/solangegueiros/register-learn-solidity.

Antes de iniciar con la programación de Contratos inteligentes es muy importante tener claro algunos conceptos clave, como lo son:

- Licencia: Se suele usar este encabezado (```// SPDX-License-Identifier: GPL-3.0```) en todos los contratos inteligentes, esto es usado para declarar la licencia y recibir permiso de uso, edición, distribución, y todo lo que requerimos para crear código y ser los dueños de productos con esta base tecnologica.

- Versión del compilador: Lo segundo que tiene un encabezado es la versión del compilador ```pragma solidity 0.8.19;```, esta versión es muy importante ya que es la encargada de compilar nuestro código y enviarlo a lenguaje que la maquina virtual de ethereum pueda entender, en estas versiones van corrigiendo problemas que han causado hackeos o problemas de memoría, a continuación un ejemplo de desbordamiento de memoria en una versión antigua del compilador:

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

- Declaración del contrato: Para crear un contrato además de todo lo anterior mencionado es necesario usar la palabra reservada ```contract``` seguida del nombre del contrato con la primera letra en mayuscula como en el ejemplo de ```OverflowExample``` quedando algo así ```contract OverflowExample { ... }``` donde los ```...``` representan nuestro código dentro del contrato.

### 0_read_write.sol

En el contrato ```ReadWrite``` tienes la variable de estado ```myText```, puedes actualizar este valor con la función ```setText```, o puedes retornar el valor de la variable con la función ```getText```.

### 1_read_write_v2.sol

En el contrato ```ReadWrite``` puedes hacer lo mismo que en el ejemplo anterior, adicional puedes medir el número de cambios hechos a lo largo de la historia.

### 2_read_write_constructor.sol

En el contrato ```ReadWriteConstructor``` puedes hacer lo mismo que en el ejemplo anterior, adicional puedes observar un nuevo concepto, un constructor es una "función" que es llamada por el contrato inteligente al momento de su creación, por lo que puedes guardar infotmación como la billetera de quien lo desplegó, la estampa de tiempo y más.

### 3_read_write_owner.sol

En el contrato de ```ReadWriteOwner``` puedes ver un nuevo concepto, el "owner", este es asignado cuando se crea el contrato inteligente en la función del constructor, usando el valor ```msg.sender```, la cual es una variable global con la dirección pública de quien desplegó el contrato inteligente. Este concepto es usado para restringir el acceso en algunas funciones, es muy común en contratos inteligentes más complejos.

### 4_read_write_require.sol

En el contrato de ```ReadWriteRequire``` puedes ver un nuevo concepto, el "require", este es similar al "if", porque tienes una condición que debe ser cumplida, si esto no pasa, el código no continua ejecutándose, pero comparado con el "if" nos da un nuevo concepto, el "callback", este retorna el estado de cada "variable de estado" al estado inicial antes de llamar la función, adicional este muestra un mensaje de error en caso de tener uno.

### 5_global_info.sol

En el contrato ```global_info``` puedes encontrar seis funciones que retornan algunas variables globales.

- block.timestamp: Esta variable retorna la fecha en el formato unix (estándar de fechas. REF: https://www.unixtimestamp.com).
- block.number: Esta variable retorna el número del bloque que está procesando la transacción.
- block.chainid: Esta variable muestra el id de la cadena de la blockchain que se está usando.
- msg.value: Esta variable retorna el valor de crypto enviado por el usuario quien interactua con el contrato inteligente.
- msg.sender: Esta variable retorna la dirección del usuario quien está interactuando con el contrato inteligente.
- tx.origin: Esta variable retorna la dirección de quien inició la transacción.

### 6_challenge

Tienes que crear un contrato inteligente que reciba dinero de cualquier persona, este tiene que ser capaz de reconocer al usuario y bloquear los fondos recibidos por cada uno de ellos por un año después de la transacción. Ejemplo: Juan ahorra 1000 wei en un contrato, el día 06/08/2023, Juan puedes retirar el dinero solamente después de 06/08/2024, considerando la hora, minutos y segundos.

Te invito a crear un PR con tu solución y etiquetarme en las redes sociales con la URL de esta: @alejandro99so en instagram y X (Twitter).

### 7_modifier.sol

En el contrato ```MyModifier``` se introduce un nuevo concepto, el modifier, es una palabra reservada y la definición parece una función, pero con la particularidad de que esta "función" es usada en el encabezado de otras funciones, con el objetivo de modificar el comportamiento de está función, el equiivalente a un middleware, o interceptor, ya que se suele ejecutar antes del cuerpo de la función.
Para saber si se ejecuta antes o después se usa ```underscore placeholder``` que se ve así: ```_;```, y este representa la ejecución del código de la función.

- Caso 1: Si se tiene código antes del ```underscore placeholder``` este código del modifier se ejecutará antes del de la función.
- Caso 2: Si se tiene código después del ```underscore placeholder``` este código del modifier se ejecutará después de ejecutada la función.

Es más común el caso 1.

### 8_event.sol

En el contrato ```MyEvent``` se introduce nuevamente un concepto nuevo, el ```event```, este también usa una palabra reservada, esta seguida de algo similar al encabezado de una función, ya que recibe el nombre y los parametros de entrada con su respectivo tipo.

Estos eventos son muy utiles para conocer el estado de un contrato, ya que podemos reportar eventos importantes que requiera monitoreo y hacer que estos eventos ejecuten un endpoint, muestren algo en un front en tiempo real, nos notifique a un canal y mucho más, solo se requiere emitirlo en la función que requiramos y pasarle los valores de las variables que requerimos.

### 9_modifier_event.sol

En el contrato ```MyModifierEvent``` se combinan modificadores y eventos, se ve como el modificador ```onlyOwner```, valida que quien llama la función sea quien creo el contrato y una vez lo valida emite un evento informando la modificación de la variable de tipo texto.

## English version

## solidity-intro
This repository is focused on the most basic concepts about solidity, it's a guide to study if you're starting in this world. Some of the codes seen here are based on: https://github.com/solangegueiros/register-learn-solidity

Before delving into Smart Contract programming, it's crucial to have a clear understanding of some key concepts, such as:

- License: It's common to use this header (```// SPDX-License-Identifier: MIT```) in all smart contracts. This is used to declare the license and grant permission for use, editing, distribution, and everything needed to create code and own products based on this technology foundation.

- Compiler Version: The second thing in a header is the compiler version (```pragma solidity 0.8.19;```). This version is very important, as it compiles our code and translates it into a language that the Ethereum virtual machine can understand. These versions correct issues that have caused hacks or memory problems. Here's an example of a memory overflow in an older compiler version:

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

- Contract Declaration: To create a contract, besides everything mentioned above, you need to use the reserved keyword ```contract```, followed by the contract name, with the first letter in uppercase, as in the example of ```OverflowExample```, resulting in something like ```contract OverflowExample { ... }```, where the ```...``` represents our code inside the contract.

### 0_read_write.sol
In ```ReadWrite``` contract you have a state variable called ```myText```, so you can update this value with ```setText``` function, or you can return the value of variable with ```getText``` function.

### 1_read_write_v2.sol
In ```ReadWrite``` contract you can do the same than previous example, plus you can measure the number of changes made throughout history.

### 2_read_write_constructor.sol
In ```ReadWriteConstructor``` contract you can do the same than previous example, plus you can see a new concept, constructor is a "function" that is called at smart contract creation time, so you can save information like wallet who deployed, timestamp and more.

### 3_read_write_owner.sol
In ```ReadWriteOwner``` contract you can see a new concept, the "owner", it is set when the smart contract is created in the constructor function, using the value of ```msg.sender```, which is a global variable with the address who deployed that smart contract. This concept is used to lock the access in some functions, it is very common in more complex smart contracts.

### 4_read_write_require.sol
In ```ReadWriteRequire``` contract you can see a new concept, the "require", it is similar to "if", because you have a condition that have to be done, if it don't work, it not continue running the code, but it compared with "if" give us a new concept "callback", it return the state of every "state variable" to the init state before calling the function, plus it displays an error message on error.

### 5_global_info.sol

In ```global_info``` contract you can find six functions returning some global variables.

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

In ```MyModifier``` contract, a new concept is introduced: the modifier. It's a reserved keyword, and its definition appears like a function, but with the peculiarity that this "function" is used in the header of other functions. Its purpose is to modify the behavior of these functions, acting as an equivalent to a middleware or interceptor, as it's usually executed before the function's body.
To determine whether it's executed before or after, an ```underscore placeholder``` is used, which looks like this: ```_ ;```, and it represents the execution point of the function's code.

Case 1: If there's code before the ```underscore placeholder```, the modifier's code will execute before the function's code.
Case 2: If there's code after the ```underscore placeholder```, the modifier's code will execute after the function has executed.

Case 1 is more common.

### 8_event.sol

In ```MyEvent``` contract, a new concept is introduced: the ```event```. This also uses a reserved keyword, followed by something similar to a function header, as it receives the name and input parameters along with their respective types.

These events are very useful to track the state of a contract, as we can report important events that require monitoring. We can make these events trigger an endpoint, display something on a real-time front-end, notify us through a channel, and much more. It only requires emitting the event in the desired function and passing the values of the variables we need.

### 9_modifier_event.sol

In ```MyModifierEvent``` contract, modifiers and events are combined. It showcases the ```onlyOwner``` modifier, which validates that the caller of the function is the one who created the contract. Once it validates this, it emits an event informing about the modification of the text-type variable.
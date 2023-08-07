## Versión en Español
## solidity-intro
Este repositorio está enfocado en la mayoría de conceptos básicos de Solidity, esta es una buena guía para estudiar si estás iniciando en este mundo, está basada en https://github.com/solangegueiros/register-learn-solidity.

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

## English version

## solidity-intro
This repository is focused on the most basic concepts about solidity, it's a guide to study if you're starting in this world, and it's based on https://github.com/solangegueiros/register-learn-solidity

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
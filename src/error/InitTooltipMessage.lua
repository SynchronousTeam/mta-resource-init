---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
---|                                                                               |---
---|         Script by "Kyonax - Pilar Perfeccionista" Synchronous member          |---
---|       Github: https://github.com/Kyonax • G-Mail: kyonax.corp@gmail.com       |---
---|                     Code Script from Montgomery Country RP                    |---
---|                            Resource-Script: [init]                            |---
---|                       Name-Script: [InitTooltipMessage]                       |---
---|           Function-Script: Save all the posible Script Errors                 |---
---|                                                                               |---
---|                            DEV-DATE: 31/08/2020                               |---
---|                               Server Script                                   |---
---|                                number: 001                                    |---
---|                                MIT License                                    |---
---|                                                                               |---
---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---•---
local tooltip = { 
    error = { 
        notDataDigit = {
            name = 'notDataDigit',
            syntax = 'NULL_LABEL',
            message = 'El campo actual debe ser completado',
            description = 'El campo en donde te encuentras, es un campo de entrada, es decir necesitas ingresar información para poder continuar.',
            type = 'ERROR',
            number = '1'
        }, 
        notFoundAccount={ 
            name = 'notFoundAccount',
            syntax = 'NULL_QUERY_LOGIN',
            message = 'No se ha podido encontrar la cuenta en la Base de Datos.', 
            description='Se ha recibido valor NULL al realizar la búsqueda Query del Usuario en la Base de Datos, es decir que el valor Buscado no existe en la Base de Datos.',
            type = 'ERROR',
            number = '2'
        },
        notEqual = {
            name = 'notEqual',
            syntax = 'NOT_EQUAL_LABEL',
            message = 'Los datos ingresados no son iguales.',
            description = 'Se ha obtenido un ERROR de similitud a la hora de comparar dos valores que deben ser exactamente iguales.',
            type = 'ERROR',
            number = '3'
        }
        incorrectInformation ={
            name = 'incorrectInformation',
            syntax = 'NOT_EQUAL_QUERY',
            message = 'La información ingresada es incorrecta.',
            description = 'La comparación de el dato obtenido de la Base de Datos y el Ingresado ha devuelto un ERROR de similitud, es decir los datos ingresados no son iguales a los registrados en la base de datos.',
            type = 'ERROR',
            number = '4'
        },
        notFoundVariables = {
            name = 'notFoundVariables',
            syntax = 'NULL_INFORMATION',
            message = 'Las variables esenciales tienen como valor NULL.',
            description = 'Variables necesarias para le ejecución del código son de valor NULL, lo que indica que los valores no han sido digitadas o que han sido corrompidos.',
            type = 'ERROR',
            number = '5'
        },
        existAccount = {
            name = 'existAccount',
            syntax = 'MULTIPLE_VALUES_QUERY',
            message = 'El usuario digitado no se encuentra disponible.',
            description = 'El nombre de usuario para crear la cuenta ya se encuentra registrado en la Base de Datos, lo que causa un error de multiples valores registrados.',
            type = 'ERROR',
            number = '6'
        },
        existDiscordID = {
            name = 'existDiscordID',
            syntax = 'MULTIPLE_VALUES_QUERY',
            message = 'La ID de Discord digitada ya se encuentra en uso.',
            description = 'La ID de Discord se encontró en la base de datos, lo que quiere decir que otra cuenta está registrada con esta ID.',
            type = 'ERROR',
            number = '7'
        },
        notValidPassword = {
            name = 'notValidPassword',
            syntax = 'LOW_SECURITY_ACCOUNT',
            message = 'La contraseña no es segura',
            description = 'Existen algunos requerimientos para acceder al Servidor, uno de ellos es tener una contraseña de más de 6 carácteres.',
            type = 'ERROR',
            number = '8'
        } 
    }
}


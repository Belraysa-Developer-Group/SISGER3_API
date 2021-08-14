import { ValidationError } from 'express-validator';
import { CustomError } from './custom-error';

export class RequestValidationError extends CustomError{
    statusCode = 400
    
    constructor(public errors: ValidationError[]) {
        super('Invalid request Parameter');
        
        // Only because we are extending a built in class
        Object.setPrototypeOf(this, RequestValidationError.prototype);
    }
    
    serializeError() {
        return this.errors.map( error => {
            return { message: error.msg, field: error.param }
        })
        
    }  
}

// Opcion 1 se crea la interface y se agrega "implements CustomError" a la clase

// interface CustomError {
//     statusCode: number;
//     serializeError(): {
//         message: string;
//         field?: string;
//     } []
// }


import { CustomError } from './custom-error';


export class NotFoundError extends CustomError {
    statusCode= 404;
    reason= 'Resource not found'

    constructor() {
        super('Resource not found');

        Object.setPrototypeOf(this, NotFoundError.prototype);
    }

    serializeError(){
        return [
            { 
                message: this.reason
            }
        ]
    }
}
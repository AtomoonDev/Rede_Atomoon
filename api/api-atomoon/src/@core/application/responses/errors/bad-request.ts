import { DefaultError } from '.'

export class BadRequestError extends DefaultError {    
    constructor(message: string) {
        super(400, message, 'BadRequestError')
    }
}

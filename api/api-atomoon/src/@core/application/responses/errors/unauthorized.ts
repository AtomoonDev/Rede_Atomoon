import { DefaultError } from '.'

export class UnauthorizedError extends DefaultError {
    constructor(readonly message: string) {
        super(401, message, 'UnauthorizedError')
    }
}

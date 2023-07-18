import { DefaultError } from '.'

export class ForbiddenError extends DefaultError {
    constructor(readonly message: string) {
        super(403, message, 'ForbiddenError')
    }
}
import { DefaultError } from '.'

export class ConflictError extends DefaultError {
  constructor(message: string) {
    super(409, message, 'ConflictError')
  }
}

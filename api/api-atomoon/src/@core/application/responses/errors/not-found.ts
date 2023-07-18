import { DefaultError } from '.'

export class NotFoundError extends DefaultError {
  constructor(readonly message: string) {
    super(404, message, 'NotFoundError')
  }
}

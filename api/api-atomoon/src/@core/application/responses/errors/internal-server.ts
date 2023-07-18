import { DefaultError } from "."

export class InternalServerError extends DefaultError {
  statusCode = 500

  constructor(readonly message: string) {
    super(500, message, 'InternalServerError')
  }
}
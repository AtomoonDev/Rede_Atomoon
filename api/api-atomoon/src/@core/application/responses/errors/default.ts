export class DefaultError extends Error {
  success = false
  response: { message: string; error: string }

  constructor(
    readonly statusCode: number,
    readonly description: string,
    private readonly title?: string,
  ) {
    super(description)
    this.name = title || 'DefaultError'
    this.response = {
      message: description,
      error: this.name,
    }
  }
}
